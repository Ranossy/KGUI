--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
         if not IsPlayer(dwCharacterID) then

                   return

         end
         local player = GetPlayer(dwCharacterID)

         if player then

                   local scene = player.GetScene()

                   local npc = scene.GetNpcByNickName("lieyan")

                   if npc then				
                            local nNow = player.nZ - npc.nZ

                            local nMax = 2 * 8 * 64

                            if nNow <= nMax then
																		
                                     player.AddBuff(0,99,3532,1)
                                     		
                               
                                    
                            end

                   end

         end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com