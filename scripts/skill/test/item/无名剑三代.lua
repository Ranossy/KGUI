---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/test/item/����������.lua
-- ����ʱ��:	12/29/09 10:42:05
-- �����û�:	tangyiming
-- �ű�˵��:	�����ýű�������ִ���LOG���ɲ���顣
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")
Include("scripts/Include/Item.lh")
Include("scripts/skill/test/������.lua")
 
	local tCopyName = {"zhanbao10", "zhanbao25" } --����ѡ��
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
								 ["MainhealerWH"] = {RandVenationID = {4, 9, 3}, QixueID = {43, 46, 42}},
								 ["MainhealerQX"] = {RandVenationID = {4, 9, 3}, QixueID = {43, 46, 42}},
								 ["StandarddpsQC"] = {RandVenationID = {9, 10}, QixueID = {46, 170, 43}},
								 ["StandarddpsJC"] = {RandVenationID = {7, 8}, QixueID = {44, 45, 170}},
								 ["MaintankSL"] = {RandVenationID = {4, 5, 6, 3}, QixueID = {41, 42, 170}},
								 ["DpsTC"] = {RandVenationID = {7, 8}, QixueID = {44, 45, 170}},
								 ["DpsSL"] = {RandVenationID = {9, 10}, QixueID = {46, 170, 43}},
								 ["DpsQX"] = {RandVenationID = {9, 10}, QixueID = {46, 170, 43}},
								  ["DpsWH"] = {RandVenationID = {9, 10}, QixueID = {46, 170, 43}},
								},
		}




-- ITEM�ű�, �����ʹ�õ��ߵ�ʱ�򴥷�
function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	player.OpenWindow(TARGET.PLAYER, player.dwID, 
		"\n\n\n" .. SKILL_STRING_TABLE[25187] .. "\n\n\n" ..
		SKILL_STRING_TABLE[25201] .. "\n" .. 
		SKILL_STRING_TABLE[25188] .. "\n",
		"Page2",
		"Oldsword"
	)
	return false, false
end

function Page2(player)
	player.OpenWindow(TARGET.PLAYER, player.dwID, 
		SKILL_STRING_TABLE[25192] .. "\n" ..
		SKILL_STRING_TABLE[25186] .. "\n", 
		"CopyType", 
		"CopyType"
	)
end

function CopyType(player, nTargetType, nTargetID, nIndex)
	player.SetCustomInteger1(92, nIndex + 1)--�������һ����ұ������Լ�¼ѡ���ĸ�����
	player.OpenWindow(TARGET.PLAYER, player.dwID, 
		SKILL_STRING_TABLE[25193] .. "\n" ..
		SKILL_STRING_TABLE[25191] .. "\n" ..
		SKILL_STRING_TABLE[25189] .. "\n" ..
		SKILL_STRING_TABLE[25196] .. "\n" .. 
		SKILL_STRING_TABLE[25194] .. "\n" ..
		SKILL_STRING_TABLE[25190] .. "\n" .. 
		SKILL_STRING_TABLE[25210] .. "\n" .. 
		SKILL_STRING_TABLE[25249] .. "\n" .. 
		SKILL_STRING_TABLE[25256] .. "\n" .. 
		SKILL_STRING_TABLE[25265] .. "\n", 
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
	for k, v  in pairs(tRaidCopyEquipment) do
		if v.PlayerType ==  tTypeName[nIndex + 1] then
			player.SetForceID(v.force)
			break
		end
	end
	RemoteCallToClient(player.dwID, "OnSendSystemAnnounce", SKILL_STRING_TABLE[25198], "yellow")
	LevelUpAsYouWish(player, 70)
	for i = 1, 11 do  --ѧϰ��ҡֱ��11��
		player.LearnSkill(9002)
	end
	player.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/skill/test/item/����������.lua", nIndex + 1, 0)
end

function OnTimer(player, nParam1, nParam2)
		--ѧϰְҵ����
		if nParam2 == 0 then
			RemoteCallToClient(player.dwID, "OnSendSystemAnnounce", SKILL_STRING_TABLE[25185], "yellow")
			GetStandardCourseByForce(player, 70)--�������µ�ѧϰ���м���
			player.SetTimer(3 * GLOBAL.GAME_FPS, "scripts/skill/test/item/����������.lua", nParam1, nParam2 +1)	
		--���װ��ǰɾ��װ��
		elseif nParam2 == 1 then
			RemoteCallToClient(player.dwID, "OnSendSystemAnnounce", SKILL_STRING_TABLE[25178], "yellow")
			ResetVenation(player)--ɾ����Ϊ
			for i = 0, INVENTORY_INDEX.TOTAL - 1 do 
				for j = 0, player.GetBoxSize(i) - 1 do
					local item = player.GetItem(i, j)
					if item then
						if item.dwIndex  ~= 3666 then --��ɾ������������
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
			LearnSkillByLevel(player, 613, 1)--��CD
			player.AddMoney(0, 0, 9000000)
			player.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/skill/test/item/����������.lua", nParam1, nParam2 +1)
	
			
		--��Ӹ���������Ʒ
		elseif nParam2 == 2 then
		RemoteCallToClient(player.dwID, "OnSendSystemAnnounce", SKILL_STRING_TABLE[25179], "yellow")
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
			player.AddItem(5, 3091, 10)--��è
			player.AddItem(5, 3116, 10)--��ɽ����
			player.AddItem(5, 3099, 10)--��ңɢ
			player.AddItem(5, 2775, 10)--�򻨵�
			player.AddItem(5, 2776, 10)--��¶
			player.AddItem(5, 4996, 10)--����
			player.AddItem(5, 3554, 10)--��θ
			player.AddItem(5, 3048, 10)--����
			player.AddItem(5, 2772, 10)--����Ӱ
			player.AddItem(5, 2773, 10) --��˪
			player.AddItem(5, 2045, 10)--��¶
			player.AddItem(5, 3120, 10)--��������
			player.AddItem(5, 2771, 10)--������
			player.AddItem(5, 2780, 10)--����
			player.AddItem(5, 2770, 10)--�ɽٽ���
			--����ܲ���--����
			player.AddItem(5, 2760, 20)--Ѫħʯ
			player.AddItem(5, 2651, 20)--��̨ĥʯ
			player.AddItem(5, 2669, 20)--ҫ������Ƭ
			player.AddItem(5, 2692, 20)--����Ƭ
			player.AddItem(5, 2855, 20)--������Ƭ
			player.AddItem(5, 2691, 20)--��Ѫĥʯ
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
			player.AddItem(5, 3482, 20)--�����Ź�
			player.AddItem(5, 3533, 20)--�ϻ��ͷ��
			player.AddItem(5, 3484, 20)--��ͷ��
			player.AddItem(5, 2289, 20)--�������
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
			player.SetTimer(1 * GLOBAL.GAME_FPS, "scripts/skill/test/item/����������.lua", nParam1, nParam2 +1)
	
		--ѧϰ�����
		elseif nParam2 == 3 then
			RemoteCallToClient(player.dwID, "OnSendSystemAnnounce", SKILL_STRING_TABLE[25177], "yellow")
			--ѧϰ�����
			for i = 1, 11 do 
				player.LearnProfession(i)
				player.SetMaxProfessionLevel(i,70)
			end
			for j= 4,7 do 
				player.AddProfessionProficiency(j, 11000)
			end
			--[[GetProfession1Course(player, 70)
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
			RemoteCallToClient(player.dwID, "OnSendSystemAnnounce", SKILL_STRING_TABLE[25181], "yellow")
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
			--player.AddTrainNoLimit(5000)
			RemoteCallToClient(player.dwID, "OnSendSystemAnnounce", SKILL_STRING_TABLE[25180], "yellow")	
			for k, v in pairs(tVenationSkillTable) do 
				for i = 1, 10 do 
					if tJingmaiNeed[tCopyName[player.GetCustomInteger1(92)]][tTypeName[nParam1]].RandVenationID[i] == v.RandVenationID then
						for j = 1, 5 do 
							player.LearnSkill(v.dwSkillID)
						end
					end
				end
			end
			--������Ѩ
			for i = 1, 10 do
				if  tJingmaiNeed[tCopyName[player.GetCustomInteger1(92)]][tTypeName[nParam1]].QixueID[i] then
					for j = 1, 5 do 
						player.LearnSkill(tJingmaiNeed[tCopyName[player.GetCustomInteger1(92)]][tTypeName[nParam1]].QixueID[i])
					end
				end
			end
			player.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/skill/test/item/����������.lua", nParam1, nParam2 +1)
		
		--��������
		elseif nParam2 == 6 then
			RemoteCallToClient(player.dwID, "OnSendSystemAnnounce", SKILL_STRING_TABLE[25197], "yellow")	
			local tRecipToForceID = { [0] = {118, 130}, [1] = {218, 325} , [2] = {414, 501}, [3] = {326, 413}, [4] = {10, 117}, [5] = {131, 217},
			} --���������������
			for i = tRecipToForceID[player.dwForceID][1],  tRecipToForceID[player.dwForceID][2] do
				for j = 1,3 do 
					if player.CanLearnSkillRecipe(i, j) then
						player.AddSkillRecipe(i, j)
						--player.ActiveSkillRecipe(i, j) --�ݲ��Զ���������
					end
				end
			end
			--���ӽ����书����
			for i = tRecipToForceID[0][1],  tRecipToForceID[0][2] do
				for j = 1,3 do 
					if player.CanLearnSkillRecipe(i, j) then
						player.AddSkillRecipe(i, j)
						--player.ActiveSkillRecipe(i, j) --�ݲ��Զ���������
					end
				end
			end
			player.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/skill/test/item/����������.lua", nParam1, nParam2 +1)	
		--���ý������رն���Ľ������
		elseif nParam2 == 7 then
			RemoteCallToClient(player.dwID, "OnSendSystemAnnounce", SKILL_STRING_TABLE[25199], "yellow")	
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

function Oldsword(player, nTargetType, nTargetID, nIndex)
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["LearnVenationOpenWnd"].. "\n" ..
		LEVELUP_STRING_TABLE["AddBuffInvisible"].. "\n" ..
		LEVELUP_STRING_TABLE["ResetCD"].. "\n" ..
		LEVELUP_STRING_TABLE["GetTrain"].. "\n" ..
		LEVELUP_STRING_TABLE["ResetVenationForFree"].. "\n" ..
		LEVELUP_STRING_TABLE["CallWeaponShop"].. "\n" ..
		LEVELUP_STRING_TABLE["PackageAndHorse"].. "\n" ..
		LEVELUP_STRING_TABLE["LevelUp"].. "\n" ..
		LEVELUP_STRING_TABLE["DelAllItem"].. "\n" ..
		LEVELUP_STRING_TABLE["LevelUpOEM"].. "\n" ..
		LEVELUP_STRING_TABLE["Tansformer"].. "\n" ..
		LEVELUP_STRING_TABLE["ProfessionLevelUpOEM"].. "\n" ..
	 	LEVELUP_STRING_TABLE["CallCraftShop"].. "\n" ..
	 	LEVELUP_STRING_TABLE["GetCourseItemBase"].. "\n" .. 		--��û���װ��	 
	 	LEVELUP_STRING_TABLE["GetCourseItemMagic"].. "\n" ..		--����ڹ�װ��
	 	LEVELUP_STRING_TABLE["GetCourseItemPhysics"].. "\n" ..	--����⹦װ��
	 	LEVELUP_STRING_TABLE["GetCourseItemDefend"].. "\n" ..		--��÷���װ��
	 	LEVELUP_STRING_TABLE["GetCourseItemHeal"].. "\n" ..			--�������װ��
		LEVELUP_STRING_TABLE["GetCourseItemSet"].. "\n" ..			--�����װ
		LEVELUP_STRING_TABLE["TransportParty1"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportParty2"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportParty3"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportParty4"].. "\n" ..
		LEVELUP_STRING_TABLE["BattleField"].. "\n" ..
		LEVELUP_STRING_TABLE["GetNpcBangHui"],
		"LearnVenationOpenWnd",
		"AddBuffInvisible",
		"ResetCD",
		"GetTrain",
		"ResetVenationForFree",
		"CallWeaponShop",
		"GetPackageAndHorse",
		"GetNextCourse",
		"DeleteAllItem",
		"GetCourseOEM",
		"GetTransformer",
		"ProfessionLevelUpOEM",
		"CallCraftShop",
		"GetCourseItemBase",
		"GetCourseItemMagic",
		"GetCourseItemPhysics",
		"GetCourseItemDefend",
		"GetCourseItemHeal",
		"GetCourseItemSet",
		"TransportParty1",
		"TransportParty2",
		"TransportParty3",
		"TransportParty4",
		"CallBattleField",
		"GetNpcBangHui"	
	)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com