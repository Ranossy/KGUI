---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/ʦͽϵͳ_������ɡ������Buff��ʮ����.lua
-- ����ʱ��:	2015/11/27 15:10:56
-- �����û�:	FENGMENGJIE
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.DoAction(0, 13299) 	--������ɡ����
	player.AddBuff(0, 99, 4186, 11)--��15��
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com