-----------------------------------------------
-- 文件名    :  Talent.lua
-- 创建人    :  linjiaqi
-- 创建时间  :  2011-02-25
-- 用途(模块):  天赋系统
-- 用途  	 :  Server端天赋操作
------------------------------------------------

Include("scripts/skill/天赋/TalentTab.lua")

function UpdaetTalentSkill(player, nTalentID, nTalentLevel)
	-- 基本规则
	local TalentSkill = GetSkill(nTalentID, 1)
	if not TalentSkill then
		return ERR_TALENT_ERROR
	end
	
	if not player or nTalentID <= 0 or nTalentLevel <= 0 then
		return ERR_TALENT_ERROR
	end
	
	if not TALENT_TAB[player.dwForceID] then
		return ERR_TALENT_NOT_FIRST_FORCE
	end

	if player.nLevel < TALENT_BEGIN_LEVEL then
		return ERR_TALENT_LEVEL_LOWER
	end 
	
	local nMaxTalentPoint, nUsedTalentPoint, nHadTalentPoint, TalentPointTab, TalentSubsectionInfo = StatisticsTalentInfo(player)
	local nSeriesID, nRow, nColum = GetPositionBySkillID(player.dwForceID, nTalentID)
	local tCondition = GetTalentCondition(player.dwForceID, nTalentID)
	local nTalentOldLevel = player.GetSkillLevel(nTalentID)
	
	if nTalentLevel <= nTalentOldLevel then
		return ERR_TALENT_ERROR
	end
	if nTalentLevel > TalentSkill.dwMaxLevel then
		return ERR_TALENT_ERROR
	end
	
	if not tCondition then
		return ERR_TALENT_ERROR
	end	
	if nSeriesID == 0 or nRow == 0 or nColum == 0 or not TalentPointTab or not TalentSubsectionInfo then
		return ERR_TALENT_ERROR
	end
	
	if nHadTalentPoint <= 0 then
		return ERR_TALENT_NOT_ENOUGH_POINT
	end
	
	local nAddPoint = nTalentLevel - nTalentOldLevel
	if nHadTalentPoint < nAddPoint then
		return ERR_TALENT_NOT_ENOUGH_POINT
	end
	
	-- 天赋规则
	if player.nLevel < tCondition.nNeedLevel then
		return ERR_TALENT_LEVEL_LOWER
	end
	
	if nTalentOldLevel >= TalentSkill.dwMaxLevel then
		return ERR_TALENT_MAX_SKILL_LEVEL
	end
	
	if not TalentSubsectionInfo[nSeriesID] or not TalentSubsectionInfo[nSeriesID][nRow] then
		return ERR_TALENT_ERROR
	end
	if TalentSubsectionInfo[nSeriesID][nRow] < tCondition.nAllPoint then
		return ERR_TALENT_NOT_ENOUGH_ADDUP_POINT
	end
	
	-- 假设加点成功,用来判断系之间的关系
	-- 因为不可能存在一次加点就从0到TALENT_OPEN_SERIES_POINT的情况
	if not TalentSubsectionInfo[1] or not TalentSubsectionInfo[2] then
		return ERR_TALENT_ERROR
	end
	local nSeriesATotalPoint = TalentSubsectionInfo[1].nTotal
	local nSeriesBTotalPoint = TalentSubsectionInfo[2].nTotal
	if nSeriesID == 1 then
		nSeriesATotalPoint = nSeriesATotalPoint + nAddPoint
	elseif nSeriesID == 2 then
		nSeriesBTotalPoint = nSeriesBTotalPoint + nAddPoint
	end
	if nSeriesATotalPoint > 0 and 
	   nSeriesATotalPoint < TALENT_OPEN_SERIES_POINT and 
	   nSeriesBTotalPoint > 0 and 
	   nSeriesBTotalPoint < TALENT_OPEN_SERIES_POINT then
		return ERR_TALENT_NOT_ENOUGH_SERIES_POINT		
	end
    
	for _, tSkill in pairs(tCondition.PreviousTab) do
		local nOrderSkillID, nOrderSkillMinLevel = tSkill[1], tSkill[2]
		local nOrderSkillLevel = player.GetSkillLevel(nOrderSkillID)
		if nOrderSkillLevel < nOrderSkillMinLevel then
			return ERR_TALENT_NOT_ENOUGH_SKILL_POINT
		end
	end
	
	-- 学习新天赋
	player.UpdateTalentSkill(nTalentID, nTalentLevel)
			
	return ERR_TALENT_SUCCESS
end

function UpdateTalentSkillList(player, tUpdateTalentSkillTab)
	local nResult	 = ERR_TALENT_ERROR
	local tResultTab = {}
	
	if not player or not tUpdateTalentSkillTab then
		return nResult, tResultTab
	end
		
	for k, v in ipairs(tUpdateTalentSkillTab) do
		local nRetCode		= ERR_TALENT_ERROR
		local dwSkillID 	= v.dwSkillID
		local nSkillLevel	= v.nLevel
		
		nRetCode = UpdaetTalentSkill(player, dwSkillID, nSkillLevel)
		if nRetCode ~= ERR_TALENT_SUCCESS then
			-- 一旦失败就立刻返回
			nResult = nRetCode
			return nResult, tResultTab
		end
		
		tResultTab[k] = v
	end
	
	return ERR_TALENT_SUCCESS, tResultTab
end

-- 反应用当前装备的天赋套技能
-- bNeedSave表示是否需要将遗忘的天赋套技能保存
function UnApplyTalentSetSkill(player, dwSetID, bNeedSave)	
	if not player then
		return false
	end
	
	if not TALENT_TAB[player.dwForceID] then
		return false
	end
	
	if bNeedSave then
		player.ClearTalentSkill(dwSetID)
	end
	
	for nSeriesID = 1, #TALENT_TAB[player.dwForceID] do			
		for nRow = 1, #TALENT_TAB[player.dwForceID][nSeriesID] do
			for nColum = 1, #TALENT_TAB[player.dwForceID][nSeriesID][nRow] do
				if TALENT_TAB[player.dwForceID][nSeriesID][nRow][nColum] > 0 then
					local nSkillID = TALENT_TAB[player.dwForceID][nSeriesID][nRow][nColum]				
					if nSkillID > 0 then
						local nSkillLevel = player.GetSkillLevel(nSkillID)
						if nSkillLevel > 0 then						
							if bNeedSave then
								player.SaveTalentSkill(dwSetID, nSkillID, nSkillLevel)
							end
														
							-- 遗忘技能
							player.UpdateTalentSkill(nSkillID, 0)
						end
					end
				end
			end
		end
	end
		
	return true
end

-- 早期版本的Reset，双镇派功能推出后，用于重置玩家身上已开启的所有分页镇派经脉
function ResetTalent(player)
	if not player then
		return false
	end
	return true
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com