---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/ʦͽϵͳ_��ӳ�ɡ������Buff��ʮ����_��Ӱ.lua
-- ����ʱ��:	2017/5/19 1:48:58
-- �����û�:	ZHANGYAN0-PC
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.AddBuff(0, 99, 1575, 17)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com