---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/test/item/����������.lua
-- ����ʱ��:	12/29/09 10:42:05
-- �����û�:	zhouhengda2
-- �ű�˵��:	�����ýű�������ִ���LOG���ɲ���顣
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")
Include("scripts/Include/Item.lh")
Include("scripts/skill/test/������.lua")
 
	local tCopyName = {"zhanbao10", "zhanbao25" } --�ؾ�ѡ��
		--ְҵѡ��
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
		[ 9], --�¼���+��Ѩ��Ϊ
		[1206],  --���+����
		[40], --����+����
		[41], --����+��Ѫ
		[42], --̧��+����
		[43], --����+�˹���������
		[44], --��Ȫ+�⹦����
		[45],  --����+�⹦����
		[46], --��Ȫ+�ڹ�����
		[170], --����+�ڹ�����
		}--]]
		--��������,RandVenationIDΪ��ͨ�ľ���QixueID����Ҫ��ͨ����Ѩ
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




-- ITEM�ű�, �����ʹ�õ��ߵ�ʱ�򴥷�
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
--		"����ʽ�����޴󣬿���崻���ʹ��ʱ�Ƽ�ÿ������ʹ�ã�",
--		"<$ ʹ�þɰ�������>" .. "\n",
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
		"<$ ��Ҫȥ10��ս������>" .. "\n" ..
		"<$ ��Ҫȥ25��ս������>" .. "\n", 
		"CopyType", 
		"CopyType"
	)--]]
	player.SwitchMap(46, 32239, 1520, 1048960)
end

function CopyType(player, nTargetType, nTargetID, nIndex)
	player.SetCustomInteger1(92, nIndex - 6)--�������һ����ұ������Լ�¼ѡ���ĸ��ؾ�(�޸�ѡ���ǵö�Ӧ�޸� nIndex��+����
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
	for i = 1, 11 do  --ѧϰ��ҡֱ��11��
		player.LearnSkill(9002)
	end
	player.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/skill/test/item/����������.lua", nIndex + 1, 0)
end

function OnTimer(player, nParam1, nParam2)
	if player.bFightState then
		return
	end
		--ѧϰְҵ����
		if nParam2 == 0 then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(1, 4152), 4)
			GetStandardCourseByForce(player, 70)--�������µ�ѧϰ���м���
			player.SetTimer(3 * GLOBAL.GAME_FPS, "scripts/skill/test/item/����������.lua", nParam1, nParam2 +1)	
		--���װ��ǰɾ��װ��
		elseif nParam2 == 1 then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(1, 4145), 4)
			ResetVenation(player)--ɾ����Ϊ
			for i = 0, INVENTORY_INDEX.TOTAL - 1 do 
				for j = 0, player.GetBoxSize(i) - 1 do
					local item = player.GetItem(i, j)
					if item then
						if item.dwIndex  ~= 3666 and item.dwIndex ~= 5284 then --��ɾ������������
							player.DestroyItem(i, j)
						end
					end
				end
			end
			for i = 13, 16 do   --�Ӱ�
				player.AddItem(8, 30, 1, INVENTORY_INDEX.EQUIP, i)
			end
			player.AddItem(8, 508, 1, INVENTORY_INDEX.EQUIP, 24) --����
			LearnSkillByLevel(player, 605, 1)
		--	LearnSkillByLevel(player, 613, 1)--��CD
			player.AddMoney(0, 0, 9000000)
			player.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/skill/test/item/����������.lua", nParam1, nParam2 +1)
	
			
		--����ؾ�������Ʒ
		elseif nParam2 == 2 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(2, 8413), 4)
			--����ܲ���ҽ��
			player.AddItem(5, 3129, 10) --����
			player.AddItem(5, 3130, 10) --���
			player.AddItem(5, 3082, 10) --����ɢ
			player.AddItem(5, 3124, 10) --������
			player.AddItem(5, 3125, 10) --ǿ����
			player.AddItem(5, 3126, 10) --������
			player.AddItem(5, 3123, 10) --������
			player.AddItem(5, 3127, 10) --�ۻ���
			player.AddItem(5, 3103, 10)--����
			player.AddItem(5, 2744, 10)--����
			player.AddItem(5, 3102, 10)--����
			player.AddItem(5, 3570, 10)--չ��
			player.AddItem(5, 2722, 10)--����
			player.AddItem(5, 2721, 10)--����
			player.AddItem(5, 3089, 10)--����
		--	player.AddItem(5, 3091, 10)--��è
			player.AddItem(5, 3116, 10)--��ɽ����
			player.AddItem(5, 3099, 10)--��ңɢ
			player.AddItem(5, 2775, 10)--�򻨵�
			player.AddItem(5, 2776, 10)--��¶
			player.AddItem(5, 4996, 10)--����
			player.AddItem(5, 3554, 10)--��θ
			player.AddItem(5, 3048, 10)--����
		--	player.AddItem(5, 2772, 10)--����Ӱ
		--	player.AddItem(5, 2773, 10) --��˪
			player.AddItem(5, 2045, 10)--��¶
		--	player.AddItem(5, 3120, 10)--��������
		--	player.AddItem(5, 2771, 10)--������
			player.AddItem(5, 2780, 10)--����
		--	player.AddItem(5, 2770, 10)--�ɽٽ���
			--����ܲ���--����
			player.AddItem(5, 2760, 20)--Ѫħʯ
		--	player.AddItem(5, 2651, 20)--��̨ĥʯ
			player.AddItem(5, 2669, 20)--ҫ������Ƭ
			player.AddItem(5, 2692, 20)--����Ƭ
			player.AddItem(5, 2855, 20)--������Ƭ
		--	player.AddItem(5, 2691, 20)--��Ѫĥʯ
			player.AddItem(5, 2645, 20)--���Ƭ
			player.AddItem(5, 2644, 20)--ˮħʯ
			player.AddItem(5, 5043, 20)--������Ƭ
			player.AddItem(5, 2626, 20)--�������
			player.AddItem(5, 2618, 20)--����ħʯ
			player.AddItem(5, 2607, 20)--��ɫħʯ
			player.AddItem(5, 2608, 20)--����ħʯ
			--�����--���
			player.AddItem(5, 2286, 20)--������
			player.AddItem(5, 2287, 20)--����
			player.AddItem(5, 4972, 20)--��Բ
			player.AddItem(5, 4974, 20)--����
			player.AddItem(5, 2283, 20)--ӭ��
			player.AddItem(5, 2282, 20)--ϴ��
			player.AddItem(5, 2315, 20)--�ص�С��
			player.AddItem(5, 2285, 20)--С��
			player.AddItem(5, 2284, 20)--���ؽ�ʳ
			player.AddItem(5, 5232, 20)--Ϸ���
			player.AddItem(5, 4967, 20)--������
			player.AddItem(5, 4970, 20)--��¶��
			player.AddItem(5, 4969, 20)--���ܲ�
			player.AddItem(5, 4952, 20)--�嶹��
			player.AddItem(5, 4968, 20)--�����Ź�
			player.AddItem(5, 3214, 20)--����Ｙ˿
			player.AddItem(5, 2279, 20)--��������
		--	player.AddItem(5, 3482, 20)--�����Ź�
			player.AddItem(5, 3533, 20)--�ϻ��ͷ��
			player.AddItem(5, 3484, 20)--��ͷ��
		--	player.AddItem(5, 2289, 20)--�������
			--����ܲ���--����
			player.AddItem(5, 2451, 20)--Ь�Ӽ���
			player.AddItem(5, 2469, 20)--ñ���ڹ�AP
			player.AddItem(5, 2453, 20)--����Ԫ��
			player.AddItem(5, 2454, 20)--��������
			player.AddItem(5, 2455, 20)--���ָ���
			player.AddItem(5, 3829, 20)--��������
			player.AddItem(5, 2456, 20)--������
			player.AddItem(5, 2462, 20)--ñ������
			player.AddItem(5, 3808, 20)--Ь�Ӽ�Ѫ
			player.AddItem(5, 3803, 20)--ͷ������
			player.AddItem(5, 3804, 20)--ͷ������
			player.AddItem(5, 2471, 20)--��װ�ڹ�����
			player.AddItem(5, 2457, 20)--����Ԫ��
			player.AddItem(5, 2458, 20)--��������
			player.AddItem(5, 2459, 20)--��������
			player.AddItem(5, 2460, 20)--��������
			player.AddItem(5, 2461, 20)--������
			player.AddItem(5, 2464, 20)--��װ����
			player.AddItem(5, 3795, 20)--��װ����
			player.AddItem(5, 3794, 20)--��װ����
			player.AddItem(6, 1431, 200)--������
			player.SetTimer(1 * GLOBAL.GAME_FPS, "scripts/skill/test/item/����������.lua", nParam1, nParam2 +1)
	
		--ѧϰ�����
		elseif nParam2 == 3 then
			--[[RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "ѧϰ����ܡ�", 4)
			--ѧϰ�����
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
			player.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/skill/test/item/����������.lua", nParam1, nParam2 +1)
		
		--��װ��
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
		player.SetTimer(1 * GLOBAL.GAME_FPS, "scripts/skill/test/item/����������.lua", nParam1, nParam2 +1)
		
		--ѧϰ����
		elseif nParam2 == 5 then
			player.AddTrain(-player.nCurrentTrainValue )
			player.AddTrainNoLimit(65000)
			--������Ѩ
			for i = 1, 10 do
				if  tJingmaiNeed[tCopyName[player.GetCustomInteger1(92)]][tTypeName[nParam1]].QixueID[i] then
					for j = 1, 8 do
						if player.GetSkillLevel(tJingmaiNeed[tCopyName[player.GetCustomInteger1(92)]][tTypeName[nParam1]].QixueID[i])  < 8 then
							player.LearnSkill(tJingmaiNeed[tCopyName[player.GetCustomInteger1(92)]][tTypeName[nParam1]].QixueID[i])
						end
					end
				end
			end
			player.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/skill/test/item/����������.lua", nParam1, nParam2 +1)
		
		--��������
		elseif nParam2 == 6 then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(1, 4148), 4)	
			local tRecipToForceID = { [0] = {118, 130}, [1] = {218, 325} , [2] = {414, 501}, [3] = {326, 413}, [4] = {10, 117}, [5] = {131, 217},
			} --���������������

			player.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/skill/test/item/����������.lua", nParam1, nParam2 +1)	
		--���ý������رն���Ľ������
		elseif nParam2 == 7 then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(1, 4150), 4)	
			--���ý������رն���Ľ������
			RemoteCallToClient(player.dwID, "DoClientScript", "SetNewRecipeTipShow(false)") --�ر�����ѧϰ���
			local ClearAchievementBar = [[
								for k, v in pairs(NewCenterPanelArray) do
								    Wnd.CloseWindow(k)
								end
								NewCenterPanelArray = {}
							]]
			RemoteCallToClient(player.dwID, "DoClientScript", ClearAchievementBar) --�رճɾ����
			RemoteCallToClient(player.dwID, "DoClientScript", "Wnd.CloseWindow(\"NewSkillBar\")") --�رռ���ѧϰ���
			RemoteCallToClient(player.dwID, "DoClientScript", "SetNewRecipeTipShow(true)") --������ѧϰ���
		end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com