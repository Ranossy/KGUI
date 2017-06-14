---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/唐门/镇派/绝伦逸群_浮光掠影消失时免控1.lua
-- 更新时间:	2017/4/15 21:36:02
-- 更新用户:	XIAXIANBO1
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  唐门秘籍
-- 创建人    :  郑海星
-- 创建时间  :  20110908
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{

};

--设置武功技能级别相关数值
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		3203,
		2
	);

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
--判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end

function UnApply(dwCharacterID)
	local playerA = GetPlayer(dwCharacterID)
	if not playerA then
		return
	end

	local scene = playerA.GetScene()
	if not scene then
		return
	end

	--if scene.bIsArenaMap then
		--playerA.SetTimer(8, "scripts/skill/唐门/镇派/绝伦逸群_浮光掠影消失时免控1.lua", 0, 0)
	--end
	
	playerA.DelBuff(7158, 1)
	playerA.AddBuff(dwCharacterID, player.nLevel, 5737, 1, 1)
	playerA.DelBuff(3274, 1)
	playerA.DelBuff(3274, 2)
	playerA.DelBuff(3443, 1)
	local buff = playerA.GetBuff(5785, 1)
	playerA.DelGroupBuff(5784, 1)

	
	--[[
	if scene.bIsArenaMap then
		local playerlist = scene.GetAllPlayer()
		for i = 1, #playerlist do
			local playerOB = GetPlayer(playerlist[i])
			if playerOB and playerOB.GetBuff(10709, 0) then
				RemoteCallToClient(playerOB.dwID, "CallUIGlobalFunction", "FireUIEvent", "ON_PLAYER_HIDE", playerA.dwID, false)
			end
		end
	end
	--]]

	if not buff then
		return
	end
	local n = buff.nStackNum
	playerA.AddBuff(dwCharacterID, playerA.nLevel, 5786, 1, n)
	playerA.DelGroupBuff(5784, 1)
	playerA.DelGroupBuff(5785, 1)
	playerA.AddBuff(dwCharacterID, playerA.nLevel, 5948, 1, 1)
end

function Apply(dwCharacterID)
end

function OnTimer(player, nP1, nP2)
	--if nP1 == 0 then
		--player.SetTimer(16,"scripts/skill/唐门/镇派/绝伦逸群_浮光掠影消失时免控1.lua",1,0)
	--end
	--SyncCompetitorSkillList(player.dwID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com