---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_���������.lua
-- ����ʱ��:	2013/6/4 5:40:51
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--[[
	--���������
	if player.GetSkillLevel(6720) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6281, 1, 1)
	end
	--]]
	if player.GetSkillLevel(6726) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6284, 1, 10)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)

end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com