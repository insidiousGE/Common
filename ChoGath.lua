ChoGathMenu = Menu("Cho'Gath", "Cho'Gath")
ChoGathMenu:SubMenu("Combo", "Combo")
ChoGathMenu.Combo:Boolean("Q", "Use Q", true)
ChoGathMenu.Combo:Boolean("W", "Use W", true)

ChoGathMenu:SubMenu("Harass", "Harass")
ChoGathMenu.Harass:Boolean("Q", "Use Q Harass", true)

ChoGathMenu:SubMenu("AR", "Auto R Jungle")
ChoGathMenu.AR:Boolean("AR", "Use R To StealJungle", true)

ChoGathMenu:SubMenu("DMG", "Draw DMG")
ChoGathMenu.DMG:Boolean("Q", "Draw Q DMG", true)
ChoGathMenu.DMG:Boolean("W", "Draw W DMG", true)
ChoGathMenu.DMG:Boolean("R", "Draw R DMG", true)

ChoGathMenu:SubMenu("LaneClear", "LaneClear")
ChoGathMenu.LaneClear:Boolean("LQ", "LaneClear With Q", true)
ChoGathMenu.LaneClear:Boolean("LW", "LaneClear With W", true)

ChoGathMenu:SubMenu("JungleClear", "JungleClear")
ChoGathMenu.JungleClear:Boolean("JQ", "JungleClear With Q", true)
ChoGathMenu.JungleClear:Boolean("JW", "JungleClear With W", true)

ChoGathMenu:SubMenu("Drawings", "Drawings")
ChoGathMenu.Drawings:Boolean("Q", "Draw Q Range", true)
ChoGathMenu.Drawings:Boolean("W", "Draw W Range", false)
ChoGathMenu.Drawings:Boolean("R", "Draw R Range", false)


ChoGathMenu:SubMenu("Killsteal", "Killsteal")
ChoGathMenu.Killsteal:Boolean("R", "Killsteal with R", true)


OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then

                        local target = GetCurrentTarget()
                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,1200,1000,250,false,false)
                        local WPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),math.huge,250,675,210,false,false)
                       
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 950) and GoS:GetDistance(myHero, target) <= 950 and ChoGathMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end
						
						if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, 650) and Gos:GetDistance(myHero, target) <=623 and ChoGathMenu.Combo.W:Value() then
						CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
						end
                end
 for _,minion in pairs(GoS:GetAllMinions(MINION_ENEMY)) do
 if IOW:Mode() == "LaneClear" then
           local  minionPos = GetOrigin(minion)
                         local QPred = GetPredictionForPlayer(GoS:myHeroPos(),minion,GetMoveSpeed(minion),0,1200,1000,250,false,false)
                         local WPred = GetPredictionForPlayer(Gos:myHeroPos(),minion,GetMoveSpeed(minion),0,250,675,210,false,false)
                         
                         if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(minion, 1000) and ChoGathMenu.LaneClear.LQ:Value() then
                         CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
                         end
                         if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(minion, 675) and ChoGathMenu.LaneClear.LW:Value() then
                         CastSkillShot(_W,minionPos.x, minionPos.y, minionPos.z)
                         end
                     end

end 

for _,jungle in pairs(GoS:GetAllMinions(MINION_JUNGLE)) do
if IOW:Mode() == "LaneClear" then
local  junglePos = GetOrigin(jungle)
                 local QPred = GetPredictionForPlayer(GoS:myHeroPos(),jungle,GetMoveSpeed(jungle),0,1200,1000,250,false,false)
                 local WPred = GetPredictionForPlayer(GoS:myHeroPos(),jungle,GetMoveSpeed(jungle),0,250,675,210,false,false)

                 if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(jungle, 1000) and ChoGathMenu.JungleClear.JQ:Value() then
                 CastSkillShot(_Q,junglePos.x, junglePos.y, junglePos.z)
                 end
                 if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(jungle, 675) and ChoGathMenu.JungleClear.JW:Value() then
                 CastSkillShot(_W,junglePos.x, junglePos.y, junglePos.z)
                 end
             end
         end
             
 for _,jungle in pairs(GoS:GetAllMinions(MINION_JUNGLE)) do
local  junglePos = GetOrigin(jungle)                
                 if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(jungle, GetHitBox(myHero)+GetCastRange(myHero,_R)) and ChoGathMenu.AR.AR:Value() and GetObjectName(jungle) == "SRU_Baron" and GetCurrentHP(jungle) < 0*GetCastLevel(myHero,_R) + 1000 + 0.7*(GetBonusAP(myHero)) then
                 CastTargetSpell(jungle, _R)
                 elseif CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(jungle, GetHitBox(myHero)+GetCastRange(myHero,_R)) and ChoGathMenu.AR.AR:Value() and GetObjectName(jungle) == "SRU_Dragon" and GetCurrentHP(jungle) < 0*GetCastLevel(myHero,_R) + 1000 + 0.7*(GetBonusAP(myHero)) then
                 CastTargetSpell(jungle, _R)
                 elseif CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(jungle, GetHitBox(myHero)+GetCastRange(myHero,_R)) and ChoGathMenu.AR.AR:Value() and GetObjectName(jungle) == "SRU_Blue" and GetCurrentHP(jungle) < 0*GetCastLevel(myHero,_R) + 1000 + 0.7*(GetBonusAP(myHero)) then
                 CastTargetSpell(jungle, _R)
                 elseif CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(jungle, GetHitBox(myHero)+GetCastRange(myHero,_R)) and ChoGathMenu.AR.AR:Value() and GetObjectName(jungle) == "SRU_Red" and GetCurrentHP(jungle) < 0*GetCastLevel(myHero,_R) + 1000 + 0.7*(GetBonusAP(myHero)) then
                 CastTargetSpell(jungle, _R)
                 end

         end

if IOW:Mode() == "Harass" then
local target = GetCurrentTarget()
       local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,1200,1000,250,false,false)

       if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, 1000) and GoS:GetDistance(myHero, target) <= 950 and ChoGathMenu.Harass.Q:Value() then
        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
    end

end

for i,enemy in pairs(GoS:GetEnemyHeroes()) do

    if CanUseSpell(myHero,_Q) == READY and GoS:ValidTarget(enemy, 2000) and ChoGathMenu.DMG.Q:Value() then
    local trueDMG = GoS:CalcDamage(myHero, enemy, (60*GetCastLevel(myHero,_Q) + 20 + 1.0*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end
    if CanUseSpell(myHero,_W) == READY and GoS:ValidTarget(enemy, 2000) and ChoGathMenu.DMG.W:Value() then
    local trueDMG = GoS:CalcDamage(myHero, enemy, (50*GetCastLevel(myHero,_W) + 25 + 0.7*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end
    if CanUseSpell(myHero,_R) == READY and GoS:ValidTarget(enemy, 2000) and ChoGathMenu.DMG.R:Value() then
    local trueDMG = 175*GetCastLevel(myHero,_R) + 125 + 0.7*(GetBonusAP(myHero))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end
end



        for i,enemy in pairs(GoS:GetEnemyHeroes()) do
            local target = GetCurrentTarget()
            if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(enemy, GetHitBox(myHero)+GetCastRange(myHero,_R)) and ChoGathMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < 175*GetCastLevel(myHero,_R) + 125 + 0.7*(GetBonusAP(myHero)) then
            CastTargetSpell(enemy, _R)
            end
      end
 
if ChoGathMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1000,3,100,0xffffff00) end
if ChoGathMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,675,3,100,0xffffff00) end
if ChoGathMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,GetHitBox(myHero)+GetCastRange(myHero,_R),3,100,0xffffff00) end


end)