---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/ë��д�ĸ���BUFF.lua
-- ����ʱ��:	2014/12/10 17:45:18
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)

end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.ResetCD(851)--
	player.NotifyPainting(player.dwID, 0)
	player.SetDynamicSkillGroup(0)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com