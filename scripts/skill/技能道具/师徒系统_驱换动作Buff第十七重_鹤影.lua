---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/ʦͽϵͳ_��������Buff��ʮ����_��Ӱ.lua
-- ����ʱ��:	2017/5/19 1:34:59
-- �����û�:	ZHANGYAN0-PC
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.DoAction(0, 13360) 	--������ɡ����
	if player.nRoleType == ROLE_TYPE.STANDARD_MALE then
		player.AddBuff(0, 99, 4186, 13, 9)
	elseif player.nRoleType == ROLE_TYPE.STANDARD_FEMALE then
		player.AddBuff(0, 99, 4186, 13, 13)
	elseif player.nRoleType == ROLE_TYPE.LITTLE_BOY then
		player.AddBuff(0, 99, 4186, 13, 12)
	elseif player.nRoleType == ROLE_TYPE.LITTLE_GIRL then
		player.AddBuff(0, 99, 4186, 13, 18)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com