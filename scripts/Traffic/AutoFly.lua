---------------------------------------------------------------------->
-- �ű�����:	scripts/Traffic/AutoFly.lua
-- ����ʱ��:	2015-10-22 9:35:40
-- �����û�:	meizhu-PC
-- �ű�˵��:	�߼��Ͻ�ͨǰ�ĵ��ã�trueΪ���Գ˽�ͨ��falseΪ������
----------------------------------------------------------------------<

function CanAutoFly(player)

	if player.dwShapeShiftID ~= 0 then	-- ��ҳ����ؾ�״̬
		return false
	end
	if player.GetBuff(7732, 1) then
		player.SendSystemMessage(GetEditorString(6, 5293))
		return false
	end
	if player.GetBuff(9982, 1) then
		player.SendSystemMessage(GetEditorString(8, 6807))
		return false
	end
	if player.GetBuff(9506, 1) then
		player.SendSystemMessage(GetEditorString(8, 9045))
		return false
	end
	--˫�˶����������׶��Ͻ�ͨ�ı��ִ���
	if player.GetBuff(9219, 1) then
		player.SendSystemMessage(GetEditorString(8, 9045))
		return false
	end
	--ͨ�ý�ֹ����BUFF
	if player.GetBuff(10826, 1) then
		player.SendSystemMessage(GetEditorString(8, 9045))
		return false
	end
	return true
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com