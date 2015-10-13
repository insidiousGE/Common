CorkiMenu = Menu("Corki", "Corki")
CorkiMenu:SubMenu("Combo", "Combo")
CorkiMenu.Combo:Boolean("Q", "Use Q", true)
CorkiMenu.Combo:Boolean("E", "Use E", true)
CorkiMenu.Combo:Boolean("R", "Use R", false)
 
CorkiMenu:SubMenu("Harass", "Harass")
CorkiMenu.Harass:Boolean("Q", "Use Q ", true)

CorkiMenu:SubMenu("LaneClear", "LaneClear")
CorkiMenu.LaneClear:Boolean("LQ", "LaneClear with Q", true)

CorkiMenu:SubMenu("JungleClear", "JungleClear")
CorkiMenu.JungleClear:Boolean("JQ", "JungleClear with Q", true)
CorkiMenu.JungleClear:Boolean("JE", "JungleClear with E", true)

CorkiMenu:SubMenu("DMG", "Draw DMG")
CorkiMenu.DMG:Boolean("Q", "Draw Q Dmg", true)
CorkiMenu.DMG:Boolean("R", "Draw R Dmg", true)

CorkiMenu:SubMenu("AR", "AutoR")
CorkiMenu.AR:Boolean("AR", "Use R to steal jungle ", true)

CorkiMenu:SubMenu("Misc", "Misc")
CorkiMenu.Misc:Key("CWTM", "Jump to mouse W", string.byte("T"))
CorkiMenu.Misc:Key("CROP", "Cast R on press", string.byte("Z"))

CorkiMenu:SubMenu("Killsteal", "Killsteal")
CorkiMenu.Killsteal:Boolean("R", "Killsteal with R", true)

CorkiMenu:SubMenu("Drawings", "Drawings")
CorkiMenu.Drawings:Boolean("Q", "Draw Q Range", true)
CorkiMenu.Drawings:Boolean("W", "Draw W Range", false)
CorkiMenu.Drawings:Boolean("E", "Draw E Range", false)
CorkiMenu.Drawings:Boolean("R", "Draw R Range", false)
 
OnLoop(function(myHero)
 
        if IOW:Mode() == "Combo" then
                        local target = GetCurrentTarget() 



					              local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),700,400,825,250,false,false)
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 825) and CorkiMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						            end

                        local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,0,600,350,false,false)
						            if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, 600) and CorkiMenu.Combo.E:Value() then
						            CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						            end

                        local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2000,200,1225,250,true,false)
                        if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and GotBuff(myHero, "corkimissilebarragenc") > 0 and GoS:ValidTarget(target, 1225) and CorkiMenu.Combo.R:Value() then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
						            end

                        local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2000,200,1225,300,true,false)
                        if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and GotBuff(myHero, "mbcheck2") == 1 and GoS:ValidTarget(target, 1225) and CorkiMenu.Combo.R:Value() then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
                        end
  end 

 if IOW:Mode() == "Harass" then
                       
                        local target = GetCurrentTarget()

                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),700,400,825,250,false,false)
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 825) and CorkiMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        
                        end

        end

 for i,enemy in pairs(GoS:GetEnemyHeroes()) do

    if GOS:ValidTarget(enemy, 2000) and CorkiMenu.DMG.Q:Value() then
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (50*GetCastLevel(myHero,_Q) + 30 + 0.5*(GetBonusAP(myHero) + 0.5*(GetBaseDamage(myHero) + GetBonusDmg(myHero)))),0)
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end

    if GOS:ValidTarget(enemy, 2000) and CorkiMenu.DMG.R:Value() then 
    local trueDMG = GoS:CalcDamage(myHero, enemy, 0, (80*GetCastLevel(myHero,_R) + 20 + 0.3*(GetBonusAP(myHero) + (10*GetCastLevel(myHero,_R) + 0.5*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))),0)
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end
    
end

for _,minion in pairs(GoS:GetAllMinions(MINION_ENEMY)) do

if IOW:Mode() == "LaneClear" then
    local minionPos = GetOrigin(minion)

                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),minion,GetMoveSpeed(minion),700,400,825,250,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(minion, 825) and CorkiMenu.LaneClear.LQ:Value() then 
                        CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
        end
    end
end 

for _,jungle in pairs(GoS:GetAllMinions(MINION_JUNGLE)) do


if IOW:Mode() == "LaneClear" then
local junglePos = GetOrigin(jungle)

                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),jungle,GetMoveSpeed(jungle),700,400,825,250,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(jungle, 825) and CorkiMenu.JungleClear.JQ:Value() then 
                        CastSkillShot(_Q,junglePos.x, junglePos.y, junglePos.z)
                        end
        
                        local EPred = GetPredictionForPlayer(GoS:myHeroPos(),jungle,GetMoveSpeed(jungle),0,0,600,350,false,false)
                        if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(jungle, 600) and CorkiMenu.JungleClear.JE:Value() then 
                        CastSkillShot(_E,junglePos.x, junglePos.y, junglePos.z)
                        
       
                        end
    
    end

end

for _,jungle in pairs(GoS:GetAllMinions(MINION_JUNGLE)) do
local  junglePos = GetOrigin(jungle)

                local RPred = GetPredictionForPlayer(GoS:myHeroPos(),jungle,GetMoveSpeed(jungle),2000,200,1225,300,true,false)

                 if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(jungle, 1225) and CorkiMenu.AR.AR:Value() and GetObjectName(jungle) == "SRU_Baron" and GetCurrentHP(jungle) < GoS:CalcDamage(myHero, jungle, 0, (80*GetCastLevel(myHero,_R) + 20 + 0.3*(GetBonusAP(myHero) + (10*GetCastLevel(myHero,_R) + 0.5*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))),0) then
                 CastSkillShot(_R,junglePos.x, junglePos.y, junglePos.z)
                 elseif CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(jungle, 1225) and CorkiMenu.AR.AR:Value() and GetObjectName(jungle) == "SRU_Dragon" and GetCurrentHP(jungle) < GoS:CalcDamage(myHero, jungle, 0, (80*GetCastLevel(myHero,_R) + 20 + 0.3*(GetBonusAP(myHero) + (10*GetCastLevel(myHero,_R) + 0.5*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))),0) then
                 CastSkillShot(_R,junglePos.x, junglePos.y, junglePos.z)
                 elseif CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(jungle, 1225) and CorkiMenu.AR.AR:Value() and GetObjectName(jungle) == "SRU_Blue" and GetCurrentHP(jungle) < GoS:CalcDamage(myHero, jungle, 0, (80*GetCastLevel(myHero,_R) + 20 + 0.3*(GetBonusAP(myHero) + (10*GetCastLevel(myHero,_R) + 0.5*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))),0) then
                 CastSkillShot(_R,junglePos.x, junglePos.y, junglePos.z)
                 elseif CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(jungle, 1225) and CorkiMenu.AR.AR:Value() and GetObjectName(jungle) == "SRU_Red" and GetCurrentHP(jungle) < GoS:CalcDamage(myHero, jungle, 0, (80*GetCastLevel(myHero,_R) + 20 + 0.3*(GetBonusAP(myHero) + (10*GetCastLevel(myHero,_R) + 0.5*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))),0) then
                 CastSkillShot(_R,junglePos.x, junglePos.y, junglePos.z)
                 end

         end

local mousePos = GetMousePos()
local target = GetCurrentTarget()

                        if CanUseSpell(myHero, _W) == READY and CorkiMenu.Misc.CWTM:Value() then
                        CastSkillShot(_W, mousePos.x, mousePos.y, mousePos.z)
                        end
                         local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2000,200,1225,250,true,false)
                        if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and GotBuff(myHero, "corkimissilebarragenc") > 0 and GoS:ValidTarget(target, 1225) and CorkiMenu.Misc.CROP:Value() then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
                        end

                        local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2000,200,1225,300,true,false)
                        if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and GotBuff(myHero, "mbcheck2") == 1 and GoS:ValidTarget(target, 1225) and CorkiMenu.Misc.CROP:Value() then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
                        end

for i,enemy in pairs(GoS:GetEnemyHeroes()) do
local RPred = GetPredictionForPlayer(GoS:myHeroPos(),enemy,GetMoveSpeed(enemy),2000,200,1225,300,true,false)              
               
                if CanUseSpell(myHero, _R) == READY and CorkiMenu.Killsteal.R:Value() and RPred.HitChance == 1 and GoS:ValidTarget(enemy, 1225) and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (80*GetCastLevel(myHero,_R) + 20 + 0.3*(GetBonusAP(myHero) + (10*GetCastLevel(myHero,_R) + 0.5*(GetBaseDamage(myHero) + GetBonusDmg(myHero))))),0) then 
                 CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
                 end
               end

if CorkiMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,825,3,100,0xffffff00) end

if CorkiMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,600,3,100,0xffffff00) end

if CorkiMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,800,3,100,0xffffff00) end

if CorkiMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,1225,3,100,0xffffff00) end

end)