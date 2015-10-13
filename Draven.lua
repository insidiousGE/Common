DravenMenu = Menu("Draven", "Draven")
DravenMenu:SubMenu("Combo", "Combo")
DravenMenu.Combo:Boolean("Q", "Use Q", true)
DravenMenu.Combo:Boolean("W", "Use W", true)
DravenMenu.Combo:Boolean("E", "Use E", true)

DravenMenu:SubMenu("Harass", "Harass")
DravenMenu.Harass:Boolean("Q", "Use Q ", true)

DravenMenu:SubMenu("LaneClear", "LaneClear")
DravenMenu.LaneClear:Boolean("LQ", "LaneClear with Q", true)

DravenMenu:SubMenu("JungleClear", "JungleClear")
DravenMenu.JungleClear:Boolean("JQ", "JungleClear with Q", true)
DravenMenu.JungleClear:Boolean("JE", "JungleClear with E", true)

DravenMenu:SubMenu("AR", "AutoR")
DravenMenu.AR:Boolean("AR", "Use R to steal jungle ", true)

DravenMenu:SubMenu("Killsteal", "Killsteal:")
DravenMenu.Killsteal:Boolean("R", "Killsteal with R", true)

DravenMenu:SubMenu("Misc", "Misc")
DravenMenu.Misc:Key("CROP", "Cast R on press", string.byte("T"))

DravenMenu:SubMenu("DMG", "Draw DMG")
DravenMenu.DMG:Boolean("E", "Draw E Dmg", true)
DravenMenu.DMG:Boolean("R", "Draw R Dmg", true)

DravenMenu:SubMenu("Drawings", "Drawings:")
DravenMenu.Drawings:Boolean("E","Draw E", false)
DravenMenu.Drawings:Boolean("R","Draw R", false)
DravenMenu.Drawings:Boolean("Q","Draw Q", true)
DravenMenu.Drawings:Boolean("W","Draw W", false)
 
 
OnLoop(function(myHero)


local target = GetCurrentTarget()



if IOW:Mode() == "Combo" then



                       local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1400,250,1100,130,false,false)

                       
                        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, 750) and GoS:GetDistance(myHero, target) <= 600 and DravenMenu.Combo.Q:Value() then
                        CastSpell(_Q)
                        end
						            if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, 750) and GoS:GetDistance(myHero, target) <= 600 and DravenMenu.Combo.W:Value() then
                        CastSpell(_W)
						            end
                        if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and GoS:ValidTarget(target, 1150) and GoS:GetDistance(myHero, target) <= 900 and DravenMenu.Combo.E:Value() then
                        CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
						            end
                    end

 if IOW:Mode() == "Harass" then
                       
                        local target = GetCurrentTarget()

                        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, 750) and GoS:GetDistance(myHero, target) <= 600 and GotBuff(myHero, "dravenspinningattack") < 1 and DravenMenu.Harass.Q:Value() then
                        CastSpell(_Q)
                        
                        end

        end

        for _,minion in pairs(GoS:GetAllMinions(MINION_ENEMY)) do

if IOW:Mode() == "LaneClear" then
    
                        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(minion, 750) and GotBuff(myHero, "dravenspinningattack") < 1 and GoS:GetDistance(myHero, minion) <= 600 and DravenMenu.LaneClear.LQ:Value() then
                        CastSpell(_Q)
        end
    end
end 

for _,jungle in pairs(GoS:GetAllMinions(MINION_JUNGLE)) do


if IOW:Mode() == "LaneClear" then
local junglePos = GetOrigin(jungle)

                        if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(jungle, 750) and GoS:GetDistance(myHero, jungle) <= 600 and GotBuff(myHero, "dravenspinningattack") < 1 and DravenMenu.JungleClear.JQ:Value() then
                        CastSpell(_Q)
                        end
        
                        local EPred = GetPredictionForPlayer(GoS:myHeroPos(),jungle,GetMoveSpeed(jungle),1400,250,1100,130,false,false)
                        if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(jungle, 1100) and DravenMenu.JungleClear.JE:Value() then 
                        CastSkillShot(_E,junglePos.x, junglePos.y, junglePos.z)
                        
       
                        end
    
    end

end

for _,jungle in pairs(GoS:GetAllMinions(MINION_JUNGLE)) do
local  junglePos = GetOrigin(jungle)

                local RPred = GetPredictionForPlayer(GoS:myHeroPos(),jungle,GetMoveSpeed(jungle),2000,500,25000,160,true,false)

                 if CanUseSpell(myHero, _R) == READY and GetCastName(myHero, _R) == "DravenRCast" and GoS:ValidTarget(jungle, 25000) and GoS:GetDistance(myHero, jungle) >= 1000 and GoS:GetDistance(myHero, jungle) <= 5000 and DravenMenu.AR.AR:Value() and GetObjectName(jungle) == "SRU_Baron" and GetCurrentHP(jungle) < GoS:CalcDamage(myHero, jungle, (100*GetCastLevel(myHero,_R) - 75 + 1.1*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) then
                 CastSkillShot(_R,junglePos.x, junglePos.y, junglePos.z)
                 elseif CanUseSpell(myHero, _R) == READY and GetCastName(myHero, _R) == "DravenRCast"and GoS:ValidTarget(jungle, 25000) and GoS:GetDistance(myHero, jungle) >= 1000 and GoS:GetDistance(myHero, jungle) <= 5000 and DravenMenu.AR.AR:Value() and GoS:GetDistance(myHero, jungle) >= 1000 and GetObjectName(jungle) == "SRU_Dragon" and GetCurrentHP(jungle) < GoS:CalcDamage(myHero, jungle, (100*GetCastLevel(myHero,_R) - 75 + 1.1*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) then
                 CastSkillShot(_R,junglePos.x, junglePos.y, junglePos.z)
                 elseif CanUseSpell(myHero, _R) == READY and GetCastName(myHero, _R) == "DravenRCast" and GoS:ValidTarget(jungle, 25000) and GoS:GetDistance(myHero, jungle) >= 1000 and GoS:GetDistance(myHero, jungle) <= 5000 and DravenMenu.AR.AR:Value() and GoS:GetDistance(myHero, jungle) >= 1000 and GetObjectName(jungle) == "SRU_Blue" and GetCurrentHP(jungle) < GoS:CalcDamage(myHero, jungle, (100*GetCastLevel(myHero,_R) - 75 + 1.1*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) then
                 CastSkillShot(_R,junglePos.x, junglePos.y, junglePos.z)
                 elseif CanUseSpell(myHero, _R) == READY and GetCastName(myHero, _R) == "DravenRCast" and GoS:ValidTarget(jungle, 25000) and GoS:GetDistance(myHero, jungle) >= 1000 and GoS:GetDistance(myHero, jungle) <= 5000 and DravenMenu.AR.AR:Value() and GoS:GetDistance(myHero, jungle) >= 1000 and GetObjectName(jungle) == "SRU_Red" and GetCurrentHP(jungle) < GoS:CalcDamage(myHero, jungle, (100*GetCastLevel(myHero,_R) - 75 + 1.1*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) then
                 CastSkillShot(_R,junglePos.x, junglePos.y, junglePos.z)
                 end

         end



	      for i,enemy in pairs(GoS:GetEnemyHeroes()) do

		       local RPred = GetPredictionForPlayer(GoS:myHeroPos(),enemy,GetMoveSpeed(enemy),2000,500,25000,160,true,false)


               if CanUseSpell(myHero, _R) and RPred.HitChance == 1 and GetCastName(myHero, _R) == "DravenRCast" and GoS:ValidTarget(enemy, GetCastRange(myHero, _R)) and DravenMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, (100*GetCastLevel(myHero,_R) - 75 + 1.1*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) and GoS:GetDistance(myHero, enemy) < 5000 and GoS:GetDistance(myHero, enemy) >= 1000 then  
               CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
			   end
		end

    local target = GetCurrentTarget()

                         local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2000,500,25000,160,true,false)
                        if CanUseSpell(myHero, _R) == READY and GetCastName(myHero, _R) == "DravenRCast" and RPred.HitChance == 1 and  GoS:GetDistance(myHero, enemy) <= 5000 and GoS:ValidTarget(target, 25000) and  DravenMenu.Misc.CROP:Value() then
                        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
                        end

    for i,enemy in pairs(GoS:GetEnemyHeroes()) do

    if GOS:ValidTarget(enemy, 2000) and DravenMenu.DMG.E:Value() then
    local trueDMG = GoS:CalcDamage(myHero, enemy, (35*GetCastLevel(myHero,_E) - 35 + 0.5*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0)
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end

    if GOS:ValidTarget(enemy, 2000) and DravenMenu.DMG.R:Value() then 
    local trueDMG = GoS:CalcDamage(myHero, enemy, (100*GetCastLevel(myHero,_R) - 75 + 1.1*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0)
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end
    
end

if DravenMenu.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,600,3,100,0xffffff00) end

if DravenMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,600,3,100,0xffffff00) end

if DravenMenu.Drawings.E:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,900,3,100,0xffffff00) end

if DravenMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,5000,3,100,0xffffff00) end


    end)