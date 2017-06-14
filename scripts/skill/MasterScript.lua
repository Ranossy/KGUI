------------------------------------------------
-- 脚本名称:	scripts\skill\MasterScript.lua
-- 更新时间:	2010.02.24
-- 更新用户:	CBG
-- 效果备注: 	技能学习师通用脚本   去掉了对白号的限制：徐烔2011年1月19号
------------------------------------------------
Include("scripts/Include/LogicConst.lh")

function CanLearnSkill(player, dwSkillID, dwSkillLevel, dwMasterID)
	--Log(player.szName .. "Try Learn Skill, ID: " .. dwSkillID .. " Level: " .. dwSkillLevel .. " From: " .. dwMasterID.."刚开始");
local tSkillContrast = {
	[1] = {10026, 10062, 10017, 10023, 10024, 10061, 10101, 10076, RELATION_FORCE.PLAYER_TIANCE}, --天策内功：傲血战意（ID：10026）；铁牢律（ID：10062）
	[2] = {10021, 10028, 10018, 10019, 10088, 10089, 10102, 10036, RELATION_FORCE.PLAYER_WANHUA}, --万花内功：花间游（ID：10021）；离经易道（ID：10028）
	[3] = {10014, 10015, 10000, 10009, 10011, 10012, 10103, 10077, RELATION_FORCE.PLAYER_CHUNYANG}, --纯阳内功：紫霞功（ID：10014）；太虚剑意（ID：10015）
	[4] = {10080, 10081, 10068, 10069, 10070, 10072, 10104, 10078, RELATION_FORCE.PLAYER_QIXIU}, --七秀内功：冰心诀（ID：10081）；云裳心经（ID：10080）
	[5] = {10002, 10003, 10031, 10032, 10033, 10034, 10100, 10035, RELATION_FORCE.PLAYER_SHAOLIN}, --少林内功：洗髓经（ID：10002）；易经经（ID：10003）
	[6] = {10144, 10145, 10146, 10148, 10149, 10150, 10161, 10161, RELATION_FORCE.PLAYER_CANGJIAN}, --藏剑内功：问水决（ID：10144）；山居剑意（ID：10145）
	[7] = {10175, 10176, 10171, 10172, 10173, 10174, 10193, 10194, RELATION_FORCE.PLAYER_WUDU}, --五毒内功：毒经（ID：10175）；补天诀（ID：10176）
	[8] = {10224, 10225, 10216, 10218, 10219, 10220, 10226, 10227, RELATION_FORCE.PLAYER_TANGMEN}, --唐门内功：惊羽诀（ID：10224）；天罗诡道（ID：10225）
	}
	if dwMasterID == 44 then		--霸刀技能导师
		if player.dwForceID == 23 then
			return true
		end
	end						
	
	if dwMasterID == 42 then		--苍云技能导师
		if player.dwForceID == 21 then
			return true
		end
	end
	
	if dwMasterID == 43 then		--长歌技能导师
		if player.dwForceID == 22 then
			return true
		end
	end

	
	if dwMasterID == 1 then			--万花技能导师曲风
		if player.dwForceID == 2 then
			return true;
		end
	end
	
	if dwMasterID == 2 then			--万花技能导师孙思邈
		if player.dwForceID == 2 then
			return true;
		end
	end
	
	if dwMasterID == 3 then			--少林技能导师慧海
		if player.dwForceID == 1 then
			return true;
		end
	end
	
	if dwMasterID == 4 then			--少林技能导师澄正
		if player.dwForceID == 1 then
			return true;
		end
	end

	if dwMasterID == 5 then			--新手镇技能导师
		return true;
	end
	
	if dwMasterID == 6 then			--纯阳技能导师
		if player.dwForceID == 4 then
			return true;
		end
	end
	
	if dwMasterID == 7 then			--天策技能导师
		if player.dwForceID == 3 then
			return true;
		end
	end
	
	if dwMasterID == 8 then			--万花轻功导师
		if player.dwForceID == 2 then
			return true;
		end
	end

	if dwMasterID == 9 then			--少林轻功导师
		if player.dwForceID == 1 then
			return true;
		end
	end

	if dwMasterID == 10 then			--纯阳轻功导师
		if player.dwForceID == 4 then
			return true;
		end
	end
	
	if dwMasterID == 11 then			--天策轻功导师
		if player.dwForceID == 3 then
			return true;
		end
	end

	if dwMasterID == 12 then			--天策技能导师
		if player.dwForceID == 3 then
			return true;
		end
	end
	
	if dwMasterID == 13 then			--七秀技能导师
		if player.dwForceID == 5 then
			return true;
		end
	end

	if dwMasterID == 23 then			--藏剑技能导师
		if player.dwForceID == 8 then
			return true;
		end
	end

	if dwMasterID == 26 then			--五毒技能导师
		if player.dwForceID == 6 then
			return true;
		end
	end

	if dwMasterID == 28 then			--唐门技能导师
		if player.dwForceID == 7 then
			return true;
		end
	end

	if dwMasterID == 39 then			--明教技能导师
		if player.dwForceID == 10 then
			return true;
		end
	end
	
	if dwMasterID == 41 then			--丐帮技能导师
		if player.dwForceID == 9 then
			return true;
		end
	end	
	
	if dwMasterID == 31 then			--新手镇少林技能导师
			return true;
	end
	
	if dwMasterID == 32 then			--新手镇万花技能导师
			return true;
	end
	
	if dwMasterID == 33 then			--新手镇天策技能导师
			return true;
	end
	
	if dwMasterID == 34 then			--新手镇纯阳技能导师
			return true;
	end
	
	if dwMasterID == 35 then			--新手镇七秀技能导师
			return true;
	end
	
	if dwMasterID == 36 then			--新手镇五毒技能导师
			return true;
	end
	
	if dwMasterID == 37 then			--新手镇唐门技能导师
			return true;
	end

	if dwMasterID == 38 then			--新手镇唐门技能导师
			return true;
	end

	if dwMasterID == 40 then			--新手镇明教技能导师
			return true;
	end
	
	if dwMasterID == 14 then			--阵营天策技能导师
		if player.nLevel >= 60 then 		--非白号,60级以上

			if player.dwForceID == 3 then 						--天策自己可以学习
				return true;
			end
			
			for i = 1, 8 do 									--之前学过任何一个天策内功或者套路的可以学
				if player.GetSkillLevel(tSkillContrast[1][i]) > 0 then 		
					return true;
				end
			end
			
			local nPLayerSkillTpye = 1			--记录玩家已学过的门派内功种类
			for i = 1, 6 do 
				for j = 1, 8 do 
					if player.GetSkillLevel(tSkillContrast[i][j]) > 0 and tSkillContrast[i][9] ~= player.dwForceID then
						nPLayerSkillTpye = nPLayerSkillTpye + 1
						break
					end
				end
			end
			
			if nPLayerSkillTpye < 3 then						--门派武功种类少于3的，可以学习多一个门派的武功
				return true;
			end

		end
	end

	if dwMasterID == 15 then			--阵营万花技能导师
		if player.nLevel >= 60 then 		--非白号,60级以上

			if player.dwForceID == 2 then 						--万花自己可以学习
				return true;
			end
			
			for i = 1, 8 do 									--之前学过任何一个万花内功或者套路的可以学
				if player.GetSkillLevel(tSkillContrast[2][i]) > 0 then 		
					return true;
				end
			end
			
			local nPLayerSkillTpye = 1			--记录玩家已学过的门派内功种类
			for i = 1, 6 do 
				for j = 1, 8 do 
					if player.GetSkillLevel(tSkillContrast[i][j]) > 0 and tSkillContrast[i][9] ~= player.dwForceID then
						nPLayerSkillTpye = nPLayerSkillTpye + 1
						break
					end
				end
			end
			
			if nPLayerSkillTpye < 3 then						--门派武功种类少于3的，可以学习多一个门派的武功
				return true;
			end

		end
	end
	
	if dwMasterID == 16 then			--阵营七秀技能导师
		if player.nLevel >= 60 and player.nGender == 2 then 		--非白号,60级以上,女性角色

			if player.dwForceID == 5 then 						--七秀自己可以学习
				return true;
			end
			
			for i = 1, 8 do 									--之前学过任何一个七秀内功或者套路的可以学
				if player.GetSkillLevel(tSkillContrast[4][i]) > 0 then 		
					return true;
				end
			end
			
			local nPLayerSkillTpye = 1			--记录玩家已学过的门派内功种类
			for i = 1, 6 do 
				for j = 1, 8 do 
					if player.GetSkillLevel(tSkillContrast[i][j]) > 0 and tSkillContrast[i][9] ~= player.dwForceID then
						nPLayerSkillTpye = nPLayerSkillTpye + 1
						break
					end
				end
			end
			
			if nPLayerSkillTpye < 3 then						--门派武功种类少于3的，可以学习多一个门派的武功
				return true;
			end

		end
	end

	if dwMasterID == 17 then			--阵营纯阳技能导师
		if player.nLevel >= 60 then 		--非白号,60级以上

			if player.dwForceID == 4 then 						--纯阳自己可以学习
				return true;
			end
			
			for i = 1, 8 do 									--之前学过任何一个纯阳内功或者套路的可以学
				if player.GetSkillLevel(tSkillContrast[3][i]) > 0 then 		
					return true;
				end
			end
			
			local nPLayerSkillTpye = 1			--记录玩家已学过的门派内功种类
			for i = 1, 6 do 
				for j = 1, 8 do 
					if player.GetSkillLevel(tSkillContrast[i][j]) > 0 and tSkillContrast[i][9] ~= player.dwForceID then
						nPLayerSkillTpye = nPLayerSkillTpye + 1
						break
					end
				end
			end
			
			if nPLayerSkillTpye < 3 then						--门派武功种类少于3的，可以学习多一个门派的武功
				return true;
			end

		end
	end

	if dwMasterID == 18 then			--阵营少林技能导师
		if player.nLevel >= 60 and player.nGender == 1 then 		--非白号,60级以上,男性角色

			if player.dwForceID == 1 then 						--少林自己可以学习
				return true;
			end
			
			for i = 1, 8 do 									--之前学过任何一个少林内功或者套路的可以学
				if player.GetSkillLevel(tSkillContrast[5][i]) > 0 then 		
					return true;
				end
			end
			
			local nPLayerSkillTpye = 1			--记录玩家已学过的门派内功种类
			for i = 1, 6 do 
				for j = 1, 8 do 
					if player.GetSkillLevel(tSkillContrast[i][j]) > 0 and tSkillContrast[i][9] ~= player.dwForceID then
						nPLayerSkillTpye = nPLayerSkillTpye + 1
						break
					end
				end
			end
			
			if nPLayerSkillTpye < 3 then						--门派武功种类少于3的，可以学习多一个门派的武功
				return true;
			end

		end
	end
	
	if dwMasterID == 25 then			--阵营藏剑技能导师
		if player.nLevel >= 60 then 		--非白号,60级以上

			if player.dwForceID == 8 then 						--藏剑自己可以学习
				return true;
			end
			
			for i = 1, 8 do 									--之前学过任何一个藏剑内功或者套路的可以学
				if player.GetSkillLevel(tSkillContrast[6][i]) > 0 then 		
					return true;
				end
			end
			
			local nPLayerSkillTpye = 1			--记录玩家已学过的门派内功种类
			for i = 1, 6 do 
				for j = 1, 8 do 
					if player.GetSkillLevel(tSkillContrast[i][j]) > 0 and tSkillContrast[i][9] ~= player.dwForceID then
						nPLayerSkillTpye = nPLayerSkillTpye + 1
						break
					end
				end
			end
			
			if nPLayerSkillTpye < 3 then						--门派武功种类少于3的，可以学习多一个门派的武功
				return true;
			end

		end
	end

	if dwMasterID == 22 then			--新手村武学训练师
		Log(player.szName .. "Try Learn Skill, ID: " .. dwSkillID .. " Level: " .. dwSkillLevel .. " From: " .. dwMasterID..GetEditorString(2, 8034));
		return true;
	end

	
	if dwMasterID == 27 then			--阵营五毒技能导师
		if player.nLevel >= 60 then 		--非白号,60级以上

			if player.dwForceID == 6 then 						--五毒自己可以学习
				return true;
			end
			
			for i = 1, 8 do 									--之前学过任何一个五毒内功或者套路的可以学
				if player.GetSkillLevel(tSkillContrast[7][i]) > 0 then 		
					return true;
				end
			end
			
			local nPLayerSkillTpye = 1			--记录玩家已学过的门派内功种类
			for i = 1, 6 do 
				for j = 1, 8 do 
					if player.GetSkillLevel(tSkillContrast[i][j]) > 0 and tSkillContrast[i][9] ~= player.dwForceID then
						nPLayerSkillTpye = nPLayerSkillTpye + 1
						break
					end
				end
			end
			
			if nPLayerSkillTpye < 3 then						--门派武功种类少于3的，可以学习多一个门派的武功
				return true;
			end

		end
	end

	if dwMasterID == 29 then			--阵营唐门技能导师
		if player.nLevel >= 60 then 		--非白号,60级以上

			if player.dwForceID == 7 then 						--唐门自己可以学习
				return true;
			end
			
			for i = 1, 8 do 									--之前学过任何一个唐门内功或者套路的可以学
				if player.GetSkillLevel(tSkillContrast[8][i]) > 0 then 		
					return true;
				end
			end
			
			local nPLayerSkillTpye = 1			--记录玩家已学过的门派内功种类
			for i = 1, 6 do 
				for j = 1, 8 do 
					if player.GetSkillLevel(tSkillContrast[i][j]) > 0 and tSkillContrast[i][9] ~= player.dwForceID then
						nPLayerSkillTpye = nPLayerSkillTpye + 1
						break
					end
				end
			end
			
			if nPLayerSkillTpye < 3 then						--门派武功种类少于3的，可以学习多一个门派的武功
				return true;
			end

		end
	end
    return false;
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com