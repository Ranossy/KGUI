---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/90级奇穴/玉石判定dot层数.lua
-- 更新时间:	2014/7/18 22:59:30
-- 更新用户:	mengxiangfei
-- 脚本说明:
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

	--商阳指
	local lv1 = player.GetSkillLevel(180)
	if lv1 ~= 0 then
		local buff1 = target.GetBuffByOwner(666, lv1, player.dwID)
		if buff1 then
			nbuffcount = nbuffcount + buff1.nLeftActiveCount
		end
	end
	--钟林毓秀
	local lv2 = player.GetSkillLevel(189)
	if lv2 ~= 0 then
		local buff2 = target.GetBuffByOwner(714, lv2, player.dwID)
		if buff2 then
			nbuffcount = nbuffcount + buff2.nLeftActiveCount
		end
	end
	--兰摧玉折
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
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com