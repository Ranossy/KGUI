---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/��ڤ����ƪ.lua
-- ����ʱ��:	08/24/10 15:29:28
-- �����û�:	zhengkaifeng
-- �ű�˵��:	�ײ˵������޳ǣ��׵�����һ��꣬�߻����������ڡ�������������ͨ���㸡��JQ������
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

-- �����¼�, ����ͼ���س�ʼ����ʱ�򴥷�һ��
function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	
	if player.nLevel >= 80 then
		player.SendSystemMessage(GetEditorString(1, 9185))
		return false, false
	end
	
	if player.GetBuff(2129, 1) then
		player.SendSystemMessage(GetEditorString(1, 9186))
		return false, false
	else
		player.AddBuff(0, 99, 2129, 1)
		return false, true
	end
	-- ����Ҫ����������ֵ��ȷ��: 1] �Ƿ����ʹ�õ����Դ����� 2] �Ƿ����ٴ˵���
	return false, false
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com