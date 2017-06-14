---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/ACT_95级门派事件/自动发奖.lua
-- 更新时间:	2015/11/17 15:47:16
-- 更新用户:	xutong3
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Map/ACT_通用PQ/include/通用PQ头文件.lua")
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
--	print("OnRemove")
	if IsRemotePlayer(nCharacterID) then
		local player = GetPlayer(nCharacterID)
		if not player then
			return
		end
		player.AddBuff(player.dwID, player.nLevel, BuffID, 1, 1)
		local buff = player.GetBuff(BuffID, 1)
		if buff then
			buff.nCustomValue = nCustomValue
		end
		return
	end
	
	RemoteCallToCenter("On_PQ_GetCenterData","COMMENTPQRESULT"..nCustomValue,nCharacterID,"COMMENTPQRESULT",nCustomValue,BuffID)
	--local player = GetPlayer(nCharacterID)
	--local nPlayerGongXian, nLastModifyTime = player.GetPlayerPQValue(nCustomValue)
	--if nPlayerGongXian >= 10 then
	--Tool_SendRewardToPlayer(player, nCustomValue, 1)
	--end
end
function COMMENTPQ_DelaySendReward(szDataName, Data, nCustom1, nCustom2, nCustom3,nCustom4)
	--print(nCustom1)
	--print(Data)
	local player = GetPlayer(nCustom1)
	if not player then
		return
	end
	if not Data then
		print(GetEditorString(9, 794))
		return
	end
	if Data == "acting" then
		player.AddBuff(player.dwID, player.nLevel, nCustom4, 1, 1)
		local buff = player.GetBuff(nCustom4, 1)
		if buff then
			buff.nCustomValue = nCustom3
		end
		return
	end
	local nPlayerGongXian, nLastModifyTime = player.GetPlayerPQValue(nCustom3)
	if nPlayerGongXian < 10 then
		return
	end
	if Data == "lose" then
		Tool_SendRewardToPlayer(player, nCustom3, -1)
		return
	end
	if Data == "win" then
		Tool_SendRewardToPlayer(player, nCustom3, 1)
		return
	end

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com