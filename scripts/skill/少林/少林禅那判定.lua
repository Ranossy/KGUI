---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/���������ж�.lua
-- ����ʱ��:	2013/5/31 20:22:22
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)			--624buff����3���һ����
	if player.GetSkillLevel(6586) == 1 then
		if player.bFightState and player.nAccumulateValue >= 3 then
			if not player.GetBuff(6195, 1) then
				player.AddBuff(dwCharacterID, player.nLevel, 6194, 1, 1)
				player.AddBuff(dwCharacterID, player.nLevel, 6195, 1, 1)
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)

end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com