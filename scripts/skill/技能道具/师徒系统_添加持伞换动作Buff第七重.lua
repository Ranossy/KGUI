---------------------------------------------------------------------->
-- �ű�����:	G:/zhugan/client/scripts/skill/���ܵ���/ʦͽϵͳ_��ӳ�ɡ������Buff������.lua
-- ����ʱ��:	2012-10-24 9:57:58
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.AddBuff(0, 99, 1575, 7)--��ӿ�ɡ��ӳ�ɡ������Buff������
	
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com