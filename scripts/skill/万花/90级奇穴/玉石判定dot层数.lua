---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/90����Ѩ/��ʯ�ж�dot����.lua
-- ����ʱ��:	2014/7/18 22:59:30
-- �����û�:	mengxiangfei
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID,dwSkillSrcID)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end

	if not target then
		return
	end

	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local nbuffcount = 0

	--����ָ
	local lv1 = player.GetSkillLevel(180)
	if lv1 ~= 0 then
		local buff1 = target.GetBuffByOwner(666, lv1, player.dwID)
		if buff1 then
			nbuffcount = nbuffcount + buff1.nLeftActiveCount
		end
	end
	--����ع��
	local lv2 = player.GetSkillLevel(189)
	if lv2 ~= 0 then
		local buff2 = target.GetBuffByOwner(714, lv2, player.dwID)
		if buff2 then
			nbuffcount = nbuffcount + buff2.nLeftActiveCount
		end
	end
	--��������
	local lv3 = player.GetSkillLevel(190)
	if lv3 ~= 0 then
		local buff3 = target.GetBuffByOwner(711, lv3, player.dwID)
		if buff3 then
			nbuffcount = nbuffcount + buff3.nLeftActiveCount
		end
	end

	
	if nbuffcount ~= 0 and player.GetSkillLevel(9477) == 1 then
		for i = 1, nbuffcount do
			player.AddBuff(player.dwID,player.nLevel,8102,1)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com