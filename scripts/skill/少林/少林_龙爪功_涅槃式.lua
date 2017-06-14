---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/少林_龙爪功_涅槃式.lua
-- 更新时间:	2013/7/25 15:27:19
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人    :  CBG
-- 创建时间  :  2011-04-01
-- 用途(模块):  武功技能
-- 武功门派  :  少林
-- 武功类型  :  外功
-- 武功套路  :  龙爪功
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--附加仇恨暂定和技能伤害相等
tSkillData = 
{
	{nDamage = 120 * 0.95, nDamageRand = 120 * 0.1, nCostMana = 53 }, --level 1
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
	--ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
	--"skill/少林/少林_龙爪功_涅槃式.lua", -- 属性值1
	--0														-- 属性值2
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3816,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3814,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3815,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.ACCUMULATE,
		1,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		748,
		1
	);   
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
	--ATTRIBUTE_TYPE.CALL_BUFF, -- 魔法属性
	--3880, --属性值1
	--dwSkillLevel															--属性值2
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/少林/少林_龙爪功_涅槃式.lua", -- 属性值1
		0														-- 属性值2
	);
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 2687, 1);			-- 设置Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- 设置Hot 

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		--公共CD1秒
	skill.SetNormalCoolDown(1, 421);
	skill.SetCheckCoolDown(1, 444);
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 2 then
		skill.nCostManaBasePercent = 342*0.25;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 342;	-- 技能消耗的内力
	end
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nChannelInterval	= 15; 				-- 通道技间隔时间 
	--skill.nChannelInterval		= 64;	 			-- 通道技持续时间，单位帧数 
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
    
	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate      = 0 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate		= 0;					-- 打断目标施法的概率,基数1024
    
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 8 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
	skill.nWeaponDamagePercent = 0;
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断
   
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
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetBuff(3880, 1) then
		--[[
		--降低守缺调息时间
		if player.GetSkillLevel(6595) == 1 then
			if player.GetBuff(3880, 1).nStackNum == 2 then
				if not player.GetBuff(6198, 1) then
					player.AddBuff(dwCharacterID, player.nLevel, 6198, 1, 1)
				end
			end
		end
		--]]
		--三段守缺叠众嗔
		if player.GetSkillLevel(6596) == 1 then
			if player.GetBuff(3880, 1).nStackNum == 2 then
				player.AddBuff(dwCharacterID, player.nLevel, 6417, 1, 1)
			end
			--player.AddBuff(dwCharacterID, player.nLevel, 6417, 1, 1)
		end
	end
	player.AddBuff(dwCharacterID, player.nLevel, 3880, 1, 1)

	--20%几率额外回复一点禅那
	local i
	if player.GetSkillLevel(5912) == 1 then
		i = Random(1, 10000)
		if i <= 2000 then
			player.CastSkill(1018, 1)
		end
	end
	--[[
	if player.GetSkillLevel(5915) == 1 then
		i = Random(1, 5)
		if i == 1 then
			player.CastSkill(1018, 1)
		end
	end
	--]]	   
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com