---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/test/item/无名剑二代.lua
-- 更新时间:	12/29/09 10:42:05
-- 更新用户:	zhouhengda2
-- 脚本说明:	测试用脚本，会出现大量LOG，可不检查。
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")
Include("scripts/Include/Item.lh")
Include("scripts/skill/test/无名剑.lua")
 
	local tCopyName = {"zhanbao10", "zhanbao25" } --秘境选择
		--职业选择
	local tTypeName = {  
		"MaintankTC", 
		"MainhealerWH", 
		"MainhealerQX", 
		"StandarddpsQC", 
		"StandarddpsJC", 
		"MaintankSL", 
		"DpsTC", 
		"DpsSL", 
		"DpsQX", 
		"DpsWH", 
		}
		--[[local tQixueID = {
		[ 9], --下极愈+点穴修为
		[1206],  --崇骨+传功
		[40], --气端+跑速
		[41], --腰眼+气血
		[42], --抬肩+减伤
		[43], --情中+运功不被打退
		[44], --曲泉+外功会心
		[45],  --龙玄+外功攻击
		[46], --极泉+内功会心
		[170], --合阳+内功攻击
		}--]]
		--经脉需求,RandVenationID为环通的经脉QixueID是需要打通的奇穴
		local tJingmaiNeed = {  
		["zhanbao10"] = { ["MaintankTC"] = {RandVenationID = {4, 6}, QixueID = {9}},
									 ["MainhealerWH"] = {RandVenationID = {4, 9}, QixueID = {9}},
									 ["MainhealerQX"] = {RandVenationID = {4, 9}, QixueID = {9}},
									 ["StandarddpsQC"] = {RandVenationID = {10}, QixueID = {9}},
									 ["StandarddpsJC"] = {RandVenationID = {8}, QixueID = {9}},
									 ["MaintankSL"] = {RandVenationID = {4, 5, 6}, QixueID = {9}},
									 ["DpsTC"] = {RandVenationID = {8}, QixueID = {9}},
									 ["DpsSL"] = {RandVenationID = {10}, QixueID = {9}},
									 ["DpsQX"] = {RandVenationID = {10}, QixueID = {9}},
									 ["DpsWH"] = {RandVenationID = {10}, QixueID = {9}},
									 },
		["zhanbao25"] = { ["MaintankTC"] = {RandVenationID = {4, 6, 7, 3}, QixueID = {41, 42, 45}},
								 ["MainhealerWH"] = {RandVenationID = {4, 9, 3}, QixueID = {41, 43, 46, 42}},
								 ["MainhealerQX"] = {RandVenationID = {4, 9, 3}, QixueID = {41, 43, 46, 42}},
								 ["StandarddpsQC"] = {RandVenationID = {9, 10}, QixueID = {41, 46, 170, 43}},
								 ["StandarddpsJC"] = {RandVenationID = {7, 8}, QixueID = {41, 44, 45, 170}},
								 ["MaintankSL"] = {RandVenationID = {4, 5, 6, 3}, QixueID = {41, 42, 170}},
								 ["DpsTC"] = {RandVenationID = {7, 8}, QixueID = {41, 44, 45, 170}},
								 ["DpsSL"] = {RandVenationID = {9, 10}, QixueID = {41, 46, 170, 43}},
								 ["DpsQX"] = {RandVenationID = {9, 10}, QixueID = {41, 46, 170, 43}},
								  ["DpsWH"] = {RandVenationID = {9, 10}, QixueID = {41, 46, 170, 43}},
								},
		}




-- ITEM脚本, 在玩家使用道具的时候触发
function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	player.OpenWindow(TARGET.PLAYER, player.dwID, 
		"\n\n" .. GetEditorString(1, 7908) .. "\n" ..
		GetEditorString(1, 7901) .. "\n" ..
		GetEditorString(1, 7903) .. "\n" ..
		GetEditorString(1, 7914) .. "\n" ..
		GetEditorString(1, 7906) .. "\n" ..
		GetEditorString(1, 7910) .. "\n" ..
		GetEditorString(1, 7919) .. "\n" ..
		GetEditorString(1, 7916) .. "\n" ..
		GetEditorString(1, 7911),
--		"该招式威力巨大，可能宕机，使用时推荐每人轮流使用！",
--		"<$ 使用旧版无名剑>" .. "\n",
		"Page2",
		"AddFriend",
		"GetSchoolRecipe",
		"GetGlodBird",
		"JoinCamp",
		"RewardPrestige",
		"RewardMasterPoint",
		"LearnProfession",
		"CopyType"
	)
	return false, false
end

function GetGlodBird(player)
	player.AddItem(5, 6291, 1)
end

function RewardMasterPoint(player)
	local nMentorValue = 1000
	player.AddUsableMentorValue(nMentorValue, GetEditorString(1, 7917))
	player.nAcquiredMentorValue = player.nAcquiredMentorValue + nMentorValue
end

function RewardPrestige(player)
	if player.nCamp == 0 then
		player.SendSystemMessage(GetEditorString(1, 7918))
		return
	end
	player.AddPrestige(70000)
end

function AddFriend(player)
	local friend = player.GetSelectCharacter()
	if friend then
		player.AddFellowshipAttraction(friend.dwID, 10000)
	end
end

function JoinCamp(player, nTargetType, nTargetID, nIndex)
	if player.nCamp ~= 0 then
		player.SendSystemMessage(GetEditorString(1, 7915))
		return
	end
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		GetEditorString(1, 7904),
		"JoinCamp1",
		"JoinCamp1"
	);
end

function LearnProfession(player)
		for i = 1, 11 do 
			player.LearnProfession(i)
			player.SetMaxProfessionLevel(i,70)
			player.AddProfessionProficiency(i, 11000)
		end
end

function JoinCamp1(player, nTargetType, nTargetID, nIndex)
	local nIndex = nIndex + 1
	if nIndex == 1 then
		player.SetCamp(1)
	elseif nIndex == 2 then
		player.SetCamp(2)
	end
end

function GetSchoolRecipe(player, nTargetType, nTargetID, nIndex)
	if player.dwForceID == 0 then
		player.SendSystemMessage(GetEditorString(1, 7913))
	else
		local szString = {
			GetEditorString(1, 7920),
			GetEditorString(1, 7909),
			GetEditorString(1, 7905),
			GetEditorString(1, 7921),
			GetEditorString(1, 7912),
		}
		player.OpenWindow(TARGET.PLAYER, player.dwID,
			szString[player.dwForceID],
			"GetSchoolRecipe1",
			"GetSchoolRecipe1"
		)
	end
end

function GetSchoolRecipe1(player, nTargetType, nTargetID, nIndex)
	local nIndex = nIndex + 1
	local tRecipe = {
		[1] = {
			{4235, 4242, 4243, 4244, 4249, 4251, 4252, 4253, 4254, 4255, 4257, 4258, 4292, 4296, 4297, 4298, 4313, 4314, 4315, 4316},
			{4224, 4225, 4226, 4254, 4255, 4260, 4261, 4248, 4249, 4250, 4278, 4279, 4280, 4286, 4287, 4288, 4289},
		},
		[2] = {
			{4407, 4409, 4410, 4413, 4414, 4418, 4428, 4432, 4463, 4465, 4468, 4470, 4473, 4443, 4445, 4442, 4477, 7781, 7783, 4453},
			{4413, 4414, 4418, 4422, 4423, 4434, 4437, 4438, 4445, 4453, 4451, 4477, 4481, 4483, 4485, 4488, 4457, 4458, 4470, 4448, 4442, 4443},
		},
		[3] = {
			{4362, 4363, 4367, 4368, 4395, 4396, 4397, 4394, 4376, 4377, 4378, 4380, 4345, 4344, 4338},
			{4324, 4329, 4330, 4326, 4347, 4352, 433, 4346, 4338, 4339, 4340, 4344, 4357, 4356, 4355},
		},
		[4] = {
			{4028, 4029, 4030, 4034, 4055, 4059, 4060, 4063, 4096, 4097, 4098, 4093, 4046, 4047, 4048},
			{4028, 4029, 4030, 4034, 4073, 4074, 4081, 4077, 4015, 4016, 4017, 4012, 4100, 4101, 4105, 4009}
		},
		[5] = {
			{4173, 4170, 4168, 4169, 4179, 4180, 4178, 4175, 4186, 4187, 4207, 4208, 4203, 4204, 4205},
			{4130, 4131, 4136, 4137, 4142, 4143, 4144, 4151, 4152, 4146, 4147, 4158, 4159, 4153, 4154,},
		},
	}
	for i = 1, #tRecipe[player.dwForceID][nIndex] do
		if player.GetFreeRoomSize() > 0 then
			player.AddItem(5, tRecipe[player.dwForceID][nIndex][i])
		else
			return
		end
	end
end

function Page2(player)
--[[	player.OpenWindow(TARGET.PLAYER, player.dwID, 
		"<$ 我要去10人战宝珈蓝>" .. "\n" ..
		"<$ 我要去25人战宝珈蓝>" .. "\n", 
		"CopyType", 
		"CopyType"
	)--]]
	player.SwitchMap(46, 32239, 1520, 1048960)
end

function CopyType(player, nTargetType, nTargetID, nIndex)
	player.SetCustomInteger1(92, nIndex - 6)--随便设置一个玩家变量，以记录选择哪个秘境(修改选项后记得对应修改 nIndex的+数）
	player.OpenWindow(TARGET.PLAYER, player.dwID, 
		GetEditorString(1, 4131) .. "\n" ..
		GetEditorString(1, 4147) .. "\n" ..
		GetEditorString(1, 4137) .. "\n" ..
		GetEditorString(1, 4149) .. "\n" .. 
		GetEditorString(1, 4142) .. "\n" ..
		GetEditorString(1, 4136) .. "\n" .. 
		GetEditorString(1, 4146) .. "\n" .. 
		GetEditorString(1, 4140) .. "\n" .. 
		GetEditorString(1, 4134) .. "\n" .. 
		GetEditorString(1, 4133) .. "\n", 
		"PlayerType", 
		"PlayerType", 
		"PlayerType", 
		"PlayerType", 
		"PlayerType", 
		"PlayerType", 
		"PlayerType", 
		"PlayerType", 
		"PlayerType", 
		"PlayerType"
	)
end

function PlayerType(player, nTargetType, nTargetID, nIndex)
	local nIndexPlayer = nIndex + 1
	if nIndexPlayer == 3 or nIndexPlayer == 9 then
		if player.nGender == CHARACTER_GENDER.MALE then
			player.SendSystemMessage(GetEditorString(1, 7907))
			return
		end
	end
	if nIndexPlayer == 6 or nIndexPlayer == 8 then
		if player.nGender == CHARACTER_GENDER.FEMALE then
			player.SendSystemMessage(GetEditorString(1, 7902))
			return
		end
		player.SetRepresentID(EQUIPMENT_REPRESENT.HAIR_STYLE, 63)
	end
	for k, v  in pairs(tRaidCopyEquipment) do
		if v.PlayerType ==  tTypeName[nIndex + 1] then
			if v.force == player.dwForceID or player.dwForceID == 0 then
				player.SetForceID(v.force)
				break
			else
				player.SendSystemMessage(GetEditorString(1, 7900))
				return
			end
		end
	end
	RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(1, 4129), 4)
	LevelUpAsYouWish(player, 70)
	for i = 1, 11 do  --学习扶摇直上11重
		player.LearnSkill(9002)
	end
	player.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/skill/test/item/无名剑二代.lua", nIndex + 1, 0)
end

function OnTimer(player, nParam1, nParam2)
	if player.bFightState then
		return
	end
		--学习职业技能
		if nParam2 == 0 then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(1, 4152), 4)
			GetStandardCourseByForce(player, 70)--无名剑下的学习所有技能
			player.SetTimer(3 * GLOBAL.GAME_FPS, "scripts/skill/test/item/无名剑二代.lua", nParam1, nParam2 +1)	
		--添加装备前删除装备
		elseif nParam2 == 1 then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(1, 4145), 4)
			ResetVenation(player)--删除修为
			for i = 0, INVENTORY_INDEX.TOTAL - 1 do 
				for j = 0, player.GetBoxSize(i) - 1 do
					local item = player.GetItem(i, j)
					if item then
						if item.dwIndex  ~= 3666 and item.dwIndex ~= 5284 then --不删除无名剑本身
							player.DestroyItem(i, j)
						end
					end
				end
			end
			for i = 13, 16 do   --加包
				player.AddItem(8, 30, 1, INVENTORY_INDEX.EQUIP, i)
			end
			player.AddItem(8, 508, 1, INVENTORY_INDEX.EQUIP, 24) --加马
			LearnSkillByLevel(player, 605, 1)
		--	LearnSkillByLevel(player, 613, 1)--清CD
			player.AddMoney(0, 0, 9000000)
			player.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/skill/test/item/无名剑二代.lua", nParam1, nParam2 +1)
	
			
		--添加秘境辅助物品
		elseif nParam2 == 2 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(2, 8413), 4)
			--生活技能补给医术
			player.AddItem(5, 3129, 10) --大蓝
			player.AddItem(5, 3130, 10) --大红
			player.AddItem(5, 3082, 10) --万灵散
			player.AddItem(5, 3124, 10) --补筋丸
			player.AddItem(5, 3125, 10) --强生丸
			player.AddItem(5, 3126, 10) --建骨丸
			player.AddItem(5, 3123, 10) --护心丸
			player.AddItem(5, 3127, 10) --聚魂丸
			player.AddItem(5, 3103, 10)--调和
			player.AddItem(5, 2744, 10)--亢龙
			player.AddItem(5, 3102, 10)--金创丸
			player.AddItem(5, 3570, 10)--展凤
			player.AddItem(5, 2722, 10)--凝神
			player.AddItem(5, 2721, 10)--长生
			player.AddItem(5, 3089, 10)--正骨
		--	player.AddItem(5, 3091, 10)--灵猫
			player.AddItem(5, 3116, 10)--空山新雨
			player.AddItem(5, 3099, 10)--逍遥散
			player.AddItem(5, 2775, 10)--万花丹
			player.AddItem(5, 2776, 10)--玉露
			player.AddItem(5, 4996, 10)--玄阴
			player.AddItem(5, 3554, 10)--健胃
			player.AddItem(5, 3048, 10)--飞鱼
		--	player.AddItem(5, 2772, 10)--金针影
		--	player.AddItem(5, 2773, 10) --天霜
			player.AddItem(5, 2045, 10)--碧露
		--	player.AddItem(5, 3120, 10)--鬼门银针
		--	player.AddItem(5, 2771, 10)--金针烟
			player.AddItem(5, 2780, 10)--化功
		--	player.AddItem(5, 2770, 10)--渡劫金针
			--生活技能不给--锻造
			player.AddItem(5, 2760, 20)--血魔石
		--	player.AddItem(5, 2651, 20)--龙台磨石
			player.AddItem(5, 2669, 20)--耀龙银甲片
			player.AddItem(5, 2692, 20)--鬼虎甲片
			player.AddItem(5, 2855, 20)--玄铁甲片
		--	player.AddItem(5, 2691, 20)--龙血磨石
			player.AddItem(5, 2645, 20)--天罡甲片
			player.AddItem(5, 2644, 20)--水魔石
			player.AddItem(5, 5043, 20)--银龙甲片
			player.AddItem(5, 2626, 20)--八瑞擦布
			player.AddItem(5, 2618, 20)--基础魔石
			player.AddItem(5, 2607, 20)--润色魔石
			player.AddItem(5, 2608, 20)--铁纹魔石
			--生活技能--烹饪
			player.AddItem(5, 2286, 20)--贵妃宴
			player.AddItem(5, 2287, 20)--万寿
			player.AddItem(5, 4972, 20)--团圆
			player.AddItem(5, 4974, 20)--欢庆
			player.AddItem(5, 2283, 20)--迎客
			player.AddItem(5, 2282, 20)--洗尘
			player.AddItem(5, 2315, 20)--地道小炒
			player.AddItem(5, 2285, 20)--小炒
			player.AddItem(5, 2284, 20)--昆仑禁食
			player.AddItem(5, 5232, 20)--戏凤饺
			player.AddItem(5, 4967, 20)--酱猪肉
			player.AddItem(5, 4970, 20)--甘露羹
			player.AddItem(5, 4969, 20)--酱萝卜
			player.AddItem(5, 4952, 20)--煎豆腐
			player.AddItem(5, 4968, 20)--椒盐排骨
			player.AddItem(5, 3214, 20)--脆瓜里脊丝
			player.AddItem(5, 2279, 20)--酱爆腰花
		--	player.AddItem(5, 3482, 20)--醋溜排骨
			player.AddItem(5, 3533, 20)--老火骨头汤
			player.AddItem(5, 3484, 20)--骨头汤
		--	player.AddItem(5, 2289, 20)--蒜香白肉
			--生活技能补给--缝纫
			player.AddItem(5, 2451, 20)--鞋子加速
			player.AddItem(5, 2469, 20)--帽子内功AP
			player.AddItem(5, 2453, 20)--护手元气
			player.AddItem(5, 2454, 20)--护手力量
			player.AddItem(5, 2455, 20)--护手根骨
			player.AddItem(5, 3829, 20)--护手体制
			player.AddItem(5, 2456, 20)--护手身法
			player.AddItem(5, 2462, 20)--帽子治疗
			player.AddItem(5, 3808, 20)--鞋子加血
			player.AddItem(5, 3803, 20)--头部体质
			player.AddItem(5, 3804, 20)--头部力量
			player.AddItem(5, 2471, 20)--下装内功会心
			player.AddItem(5, 2457, 20)--腰带元气
			player.AddItem(5, 2458, 20)--腰带力量
			player.AddItem(5, 2459, 20)--腰带根骨
			player.AddItem(5, 2460, 20)--腰带体质
			player.AddItem(5, 2461, 20)--腰带身法
			player.AddItem(5, 2464, 20)--下装治疗
			player.AddItem(5, 3795, 20)--下装体质
			player.AddItem(5, 3794, 20)--下装力量
			player.AddItem(6, 1431, 200)--生死符
			player.SetTimer(1 * GLOBAL.GAME_FPS, "scripts/skill/test/item/无名剑二代.lua", nParam1, nParam2 +1)
	
		--学习生活技能
		elseif nParam2 == 3 then
			--[[RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "学习生活技能。", 4)
			--学习生活技能
			for i = 1, 11 do 
				player.LearnProfession(i)
				player.SetMaxProfessionLevel(i,70)
			end
			for j= 4,7 do 
				player.AddProfessionProficiency(j, 11000)
			end
			GetProfession1Course(player, 70)
			GetProfession2Course(player, 70)
			GetProfession3Course(player, 70)
			GetProfession4Course(player, 70)
			GetProfession5Course(player, 70)
			GetProfession6Course(player, 70)
			GetProfession7Course(player, 70)
			GetProfession8Course(player, 70)
			GetProfession9Course(player, 70)
			GetProfession10Course(player, 70)
			GetProfession11Course(player, 70)
			--]]
			player.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/skill/test/item/无名剑二代.lua", nParam1, nParam2 +1)
		
		--穿装备
		elseif nParam2 == 4 then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(2, 8414), 4)
			for k, v  in pairs(tRaidCopyEquipment) do
				if v.CopyName == tCopyName[player.GetCustomInteger1(92)] and v.PlayerType ==  tTypeName[nParam1] then
					for i = 0, EQUIPMENT_INVENTORY.TOTAL + 1  do 
						if not player.GetItem(INVENTORY_INDEX.EQUIP, i) then
							if player.AddItem(v.nItemTabType, v.nID, 1, INVENTORY_INDEX.EQUIP, i) then
								break
							end
						end
					end
				end
			end
		player.SetTimer(1 * GLOBAL.GAME_FPS, "scripts/skill/test/item/无名剑二代.lua", nParam1, nParam2 +1)
		
		--学习经脉
		elseif nParam2 == 5 then
			player.AddTrain(-player.nCurrentTrainValue )
			player.AddTrainNoLimit(65000)
			--配置奇穴
			for i = 1, 10 do
				if  tJingmaiNeed[tCopyName[player.GetCustomInteger1(92)]][tTypeName[nParam1]].QixueID[i] then
					for j = 1, 8 do
						if player.GetSkillLevel(tJingmaiNeed[tCopyName[player.GetCustomInteger1(92)]][tTypeName[nParam1]].QixueID[i])  < 8 then
							player.LearnSkill(tJingmaiNeed[tCopyName[player.GetCustomInteger1(92)]][tTypeName[nParam1]].QixueID[i])
						end
					end
				end
			end
			player.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/skill/test/item/无名剑二代.lua", nParam1, nParam2 +1)
		
		--配置秘笈
		elseif nParam2 == 6 then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(1, 4148), 4)	
			local tRecipToForceID = { [0] = {118, 130}, [1] = {218, 325} , [2] = {414, 501}, [3] = {326, 413}, [4] = {10, 117}, [5] = {131, 217},
			} --玩家势力对照秘笈

			player.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/skill/test/item/无名剑二代.lua", nParam1, nParam2 +1)	
		--配置结束，关闭多余的界面面板
		elseif nParam2 == 7 then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(1, 4150), 4)	
			--配置结束，关闭多余的界面面板
			RemoteCallToClient(player.dwID, "DoClientScript", "SetNewRecipeTipShow(false)") --关闭秘笈学习面板
			local ClearAchievementBar = [[
								for k, v in pairs(NewCenterPanelArray) do
								    Wnd.CloseWindow(k)
								end
								NewCenterPanelArray = {}
							]]
			RemoteCallToClient(player.dwID, "DoClientScript", ClearAchievementBar) --关闭成就面板
			RemoteCallToClient(player.dwID, "DoClientScript", "Wnd.CloseWindow(\"NewSkillBar\")") --关闭技能学习面板
			RemoteCallToClient(player.dwID, "DoClientScript", "SetNewRecipeTipShow(true)") --打开秘笈学习面板
		end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com