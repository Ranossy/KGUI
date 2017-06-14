---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/帮会/额外掉落buff添加_2014721版本.lua
-- 更新时间:	2014/7/16 20:21:01
-- 更新用户:	xutong3
-- 脚本说明:	需求太刁-到时候卡我可不管……
----------------------------------------------------------------------<

Include("scripts/Map/帮会领地/include/TongDungeonRaid.lh")
Include("scripts/Map/帮会领地/include/大战本额外掉落.lua")

local tMap = {--加2层是10人本，加1层是25人本。上限6层。帮会本统一加1层-加4907
	[160] = 2,	-- 10人战宝军械库
	[171] = 1,	-- 25人战宝军械库
	[164] = 2,	-- 10人大明宫
	[165] = 1,	-- 25人大明宫
	[175] = 2,	-- 10人血战天策
	[176] = 1, 	-- 25人血战天策
	[177] = 2,	-- 10人风雪稻香村
	[178] = 1, 	-- 25人风雪稻香村
	[182] = 2,	-- 10人秦皇陵
	[183] = 1, -- 25人秦皇陵
	[191] = 2,	-- 10人夜守孤城
	[198] = 1, 	-- 25人夜守孤城
	[192] = 2,	-- 10人逐虎驱狼
	[199] = 1, -- 25人逐虎驱狼
	[211] = 2,	-- 10人挑战夜守孤城
	[205] = 1, 	-- 25人挑战夜守孤城
	[212] = 2,	-- 10人挑战逐虎驱狼
	[206] = 1, -- 25人挑战逐虎驱狼
	[220] = 2,	-- 10人仙侣庭园
	[231] = 1, 	-- 25人仙侣庭园
	[221] = 2,	-- 10人花月别院
	[230] = 1, -- 25人花月别院
	
	[234] = 2,	-- 10人挑战仙侣庭园
	[236] = 1, 	-- 25人挑战仙侣庭园
	[235] = 2,	-- 10人挑战花月别院
	[237] = 1, -- 25人挑战花月别院

	[240] = 2,	-- 10人观风殿
	[248] = 1, 	-- 25人英雄观风殿
	[241] = 2,	-- 10人双曜亭
	[249] = 1, -- 25人英雄双曜亭
	
	--[232] = 1,	-- 帮会永王行宫_仙侣庭园  帮会不需要加 统一处理。
	--[233] = 1, 	-- 帮会永王行宫_花月别院  帮会不需要加 统一处理。
}

function Apply(dwCharacterID, dwSkillSrcID)
	--常规判断处理
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	
	--非指定raid、帮会本、大战本，不处理
	if not tMap[player.GetMapID()] and not TongDungeonRaid.IsTongDungeonMap(scene) and not CurrentMapIsDaZhanMap(scene) then
		return
	end
	local nHuiGuiBuff = 0			--回归buff数
	local nTeamNumInDungeon = 0	--目前副本中的人数
	local tTeamMember = player.GetPartyMemberList()
	if not tTeamMember then
		return
	end
	local buff = player.GetBuff(3220, 10)

	local member = nil
	for i = 1, #tTeamMember do
		member = GetPlayer(tTeamMember[i])
		if member and player.GetMapID() == member.GetMapID() then			
			if scene.dwID == member.GetScene().dwID then
				nTeamNumInDungeon = nTeamNumInDungeon + 1	--记录当前副本中的人数
				if member.GetBuff(3219, 10) then
					nHuiGuiBuff = nHuiGuiBuff + 1				--记录当前副本中有共战的人数
				end
			end
		end
	end
	if nHuiGuiBuff >= 2 and (tMap[player.GetMapID()] == 1 or TongDungeonRaid.IsTongDungeonMap(scene)) then
		player.AddBuff(1, 1, 4907, 6)
	end

	--大战本处理：加一层11575
	if CurrentMapIsDaZhanMap(scene) then
		if nHuiGuiBuff > 0 and nTeamNumInDungeon >= 2 then	--有共战buff且当前秘境人数≥2人
			AddDaZhanExtraDropBuff(player)					--加一层额外掉落buff
		end
		return
	end	

	--帮会本处理：添加11560，最多10层
	if TongDungeonRaid.IsTongDungeonMap(scene) then		
		local nStackNum = math.min(nHuiGuiBuff, 10)
		local buff_Tong = player.GetBuff(11560, 1)
		if nStackNum <= 0 then
			return
		end
		if buff_Tong and buff_Tong.nStackNum == nStackNum and buff_Tong.nLeftActiveCount > 2 then--防止频繁加buff的措施
			return
		end
		player.DelGroupBuff(11560, 1)
		for i = 1, nStackNum do
			player.AddBuff(0, 99, 11560, 1, 7)
		end
		return
	end

	--Raid本处理：添加3220，最多6层
	local nBuffStuck = nHuiGuiBuff * tMap[player.GetMapID()]
	if nBuffStuck > 6 then
		nBuffStuck = 6
	end
	if nBuffStuck <= 0 then
		return
	end

	if buff and buff.nStackNum == nBuffStuck and buff.nLeftActiveCount > 2 then--防止频繁加buff的措施
		return
	end
	player.DelGroupBuff(3220, 10)
	for i = 1, nBuffStuck do
		player.AddBuff(1, 1, 3220, 10, 7)
	end
	--local tbuff = player.GetBuff(3219, 8)
	--local cbuff = player.GetBuff(3220, 8)
	--local zbuff = player.GetBuff(3461, 8)
	--local splayer = GetPlayer(dwSkillSrcID)
	--local slevel = splayer.nLevel
	--local sbuff = player.GetBuff(4907, 4)
	--if not tbuff and not cbuff and not zbuff then
	--player.AddBuff(dwSkillSrcID, slevel, 3220, 8)
	--elseif (cbuff and cbuff.dwSkillSrcID ~= dwSkillSrcID) or tbuff then
	--player.AddBuff(dwSkillSrcID, slevel, 4907, 4)
	--player.AddBuff(dwSkillSrcID, slevel, 4918, 4)
	--end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com