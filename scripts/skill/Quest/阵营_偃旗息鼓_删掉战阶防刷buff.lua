------------------------------------------------
-- ������   :   CBG	
-- ����ʱ��	:  2011-1-22
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
        if not IsPlayer(dwCharacterID) then
                   return
         end
         local player = GetPlayer(dwCharacterID)
         if player then
         	player.DelBuff(2538,1)
         	player.DelBuff(2539,1)
         	player.DelBuff(2540,1)
         end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com