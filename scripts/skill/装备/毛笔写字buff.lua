---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/ë��д��buff.lua
-- ����ʱ��:	2014/1/16 11:54:42
-- �����û�:	taoli
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
	player.ResetCD(681)
	player.NotifyPainting(player.dwID, 0)
	player.DelBuff(2587,3)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com