---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/ʦͽϵͳ_��ӳ�ɡ������Buff_����.lua
-- ����ʱ��:	2016/8/19 10:55:34
-- �����û�:	jiangzhefei1
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.AddBuff(0, 99, 1575, 16)--��ӿ�ɡ��ӳ�ɡ������Buff_����
	player.AddBuff(0, 99, 11115, 1, 1000)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com