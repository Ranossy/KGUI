---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_太素九针_锋针.lua
-- 更新时间:	2015/9/28 1:12:48
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/skill调用/中立使用复活技能活动判断.lua")

tSkillData =
{
	{ nReviveLife = 245, nReviveMana = 295, nCostMana = 225},
	{ nReviveLife = 409, nReviveMana = 491, nCostMana = 376},
	{ nReviveLife = 545, nReviveMana = 655, nCostMana = 501},
	{ nReviveLife = 682, nReviveMana = 818, nCostMana = 627},
	{ nReviveLife = 818, nReviveMana = 982, nCostMana = 752},
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.REVIVE,
		tSkillData[dwSkillLevel].nReviveLife, --复活后生命为50tSkillData[dwSkillLevel].nReviveLife
		tSkillData[dwSkillLevel].nReviveMana		--复活后内力为50tSkillData[dwSkillLevel].nReviveMana
	);
	--删除长歌救人标记buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		9298,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/万花/万花_太素九针_锋针.lua", -- 属性值1
		0														-- 属性值2
	);

	--skill.AddSlowCheckSelfBuff(2719, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff
	skill.AddSlowCheckDestBuff(203, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);	--公共CD
	skill.SetCheckCoolDown(1, 444)
	--skill.SetNormalCoolDown(1, 37);

	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= 0;
	skill.nCostManaBasePercent = 1154;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	skill.nMinPrepareFrames = 1;
	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 20 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange = 256; 									--施放角度

	skill.nPrepareFrames = 160;										--吟唱帧数,16帧等于1秒

	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧

	--skill.nBreakRate        = 1024;									--被打断的概率,默认1024表示一定被打断

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
--判断玩家的状态，以判断是否可以发出技能
	local nResult = CheckCamp(player)
	if not nResult then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 3567), 4)
		return SKILL_RESULT_CODE.FAILED
	end

	return nPreResult;
	--[[
	local target = player.GetSelectCharacter()
	local i, buff1, tbuff1, buff2, tbuff2
	if not target then
		for i = 1, 5 do
			buff1 = player.GetBuff(203, i)
			if buff1 then
				tbuff1 = 1
				break
			end
		end
		if (not player.GetBuff(5971, 1)) and tbuff ~= 1 then
			return nPreResult;
		elseif player.nCurrentLife <= player.nMaxLife * 0.01 then
			player.SendSystemMessage("自身气血值过低，无法施展该招式")
			return false
		else
			return false
		end
	else
		for i = 1, 5 do
			buff2 = target.GetBuff(203, i)
			if buff2 then
				tbuff2 = 1
				break
			end
		end
		if target.nMoveState == 16  then
			if not player.GetBuff(6009, 1) then
				player.AddBuff(player.dwID, player.nLevel, 6009, 1, 1)
			end
			return nPreResult;
		elseif ((not player.GetBuff(5971, 1)) and IsParty(player.dwID, target.dwID)) or (player.dwID == target.dwID and (not player.GetBuff(5971, 1))) then
			return nPreResult;
		elseif target.nCurrentLife <= target.nMaxLife * 0.01 then
			player.SendSystemMessage("目标气血值过低，无法施展该招式")
			return false
		elseif tbuff2 == 1 then
			player.SendSystemMessage("目标已有不会重伤的效果，无法施展该招式")
			return false
		else
			return false
		end
	end
	--]]
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(48)
	end
end

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end
	--[[
	if (not player.GetBuff(6009, 1)) then
		if (target.nMoveState ~= 16 and IsParty(dwCharacterID, dwSkillSrcID)) or dwCharacterID == dwSkillSrcID then
			if target.nCurrentLife > target.nMaxLife * 0.01 then
				target.AddBuff(dwSkillSrcID, player.nLevel, 5970, 1, 1800)
				player.AddBuff(dwSkillSrcID, player.nLevel, 5971, 1, 1)
			else
				player.SendSystemMessage("目标气血值过低，无法获得锋针效果")
			end
		end
	end
	--]]
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com