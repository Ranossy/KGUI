------------------------------------------------
-- �ļ���    :  ��Ԫ������.lua
-- ������    :  CBG	
-- ����ʱ��  :  2009-10-12
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  �����ǿ
------------------------------------------------
function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	player.AddTrainNoLimit(500)
	player.AddBuff(0,99,1435,1)
	-- ����Ҫ����������ֵ��ȷ��: 1] �Ƿ����ʹ�õ����Դ����� 2] �Ƿ����ٴ˵���
	return false, true
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com