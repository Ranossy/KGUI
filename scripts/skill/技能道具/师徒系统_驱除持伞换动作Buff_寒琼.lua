---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/ʦͽϵͳ_������ɡ������Buff_����.lua
-- ����ʱ��:	2016/8/19 11:19:11
-- �����û�:	jiangzhefei1
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.DoAction(0, 13332) 	--������ɡ����
	player.AddBuff(0, 99, 4186, 12)--����
	if player.nRoleType == ROLE_TYPE.LITTLE_GIRL then
		player.SetTimer(30,"scripts/skill/���ܵ���/ʦͽϵͳ_������ɡ������Buff_����.lua",0,0)
	elseif player.nRoleType == ROLE_TYPE.LITTLE_BOY then
		player.SetTimer(33,"scripts/skill/���ܵ���/ʦͽϵͳ_������ɡ������Buff_����.lua",0,0)
	elseif player.nRoleType == ROLE_TYPE.STANDARD_MALE then
		player.SetTimer(20,"scripts/skill/���ܵ���/ʦͽϵͳ_������ɡ������Buff_����.lua",0,0)
	elseif player.nRoleType == ROLE_TYPE.STANDARD_FEMALE then
		player.SetTimer(24,"scripts/skill/���ܵ���/ʦͽϵͳ_������ɡ������Buff_����.lua",0,0)
	end	
end

function OnTimer(player, param1, param2)
	player.DelBuff(4186,12)
	for i = 1, 100 do
		player.DelGroupBuff(409, i)--����ɾ��
	end
	player.DelBuff(9320, 1)	--ɾ�� ������ѩ
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com