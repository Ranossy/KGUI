---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/ʦͽϵͳ_������ɡ������Buff��ʮ����.lua
-- ����ʱ��:	2015/7/28 15:40:55
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.DoAction(0, 13277) 	--������ɡ����
	player.AddBuff(0, 99, 4186, 10)--��14��
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com