--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
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

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com