---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/霓裳羽衣_国色天香_对友方治疗.lua
-- 更新时间:	2013/5/11 13:18:48
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人    :  张豪	
-- 创建时间  :  2011-04-16
-- 技能效果  :  治疗
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nTherapy = 117*0.95, nTherapyRand = 117*0.1, nCostMana = 42 },
	{nTherapy = 122*0.95, nTherapyRand = 122*0.1, nCostMana = 42 },
	{nTherapy = 127*0.95, nTherapyRand = 127*0.1, nCostMana = 42 },
	{nTherapy = 132*0.95, nTherapyRand = 132*0.1, nCostMana = 42 },
	{nTherapy = 137*0.95, nTherapyRand = 137*0.1, nCostMana = 42 },
	{nTherapy = 142*0.95, nTherapyRand = 142*0.1, nCostMana = 42 },
	{nTherapy = 147*0.95, nTherapyRand = 147*0.1, nCostMana = 42 },
	{nTherapy = 152*0.95, nTherapyRand = 152*0.1, nCostMana = 42 },
	{nTherapy = 157*0.95, nTherapyRand = 157*0.1, nCostMana = 42 },
	{nTherapy = 162*0.95, nTherapyRand = 162*0.1, nCostMana = 42 },
	{nTherapy = 167*0.95, nTherapyRand = 167*0.1, nCostMana = 42 },
	{nTherapy = 172*0.95, nTherapyRand = 172*0.1, nCostMana = 42 },
	{nTherapy = 177*0.95, nTherapyRand = 177*0.1, nCostMana = 42 },
	{nTherapy = 182*0.95, nTherapyRand = 182*0.1, nCostMana = 42 },
	{nTherapy = 187*0.95, nTherapyRand = 187*0.1, nCostMana = 42 },
	{nTherapy = 192*0.95, nTherapyRand = 192*0.1, nCostMana = 42 },
	{nTherapy = 197*0.95, nTherapyRand = 197*0.1, nCostMana = 42 },
	{nTherapy = 202*0.95, nTherapyRand = 202*0.1, nCostMana = 42 },
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false
	local dwSkillLevel = skill.dwLevel
		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY, -- 治疗基础值
		tSkillData[dwSkillLevel].nTherapy/3,
		0
	);
		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND, -- 治疗浮动值
		tSkillData[dwSkillLevel].nTherapyRand/3,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_THERAPY, -- Call治疗
		0,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/七秀/霓裳羽衣_国色天香_对友方治疗.lua",
		0
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --需求剑舞BUFF

	skill.AddSlowCheckDestOwnBuff(680, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	skill.AddSlowCheckDestOwnBuff(681, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostMana = tSkillData[dwSkillLevel].nCostMana;
	
	skill.AddCheckSelfLearntSkill(5887, 1, SKILL_COMPARE_FLAG.EQUAL);     --检查比较Caster自己已学习的技能ID和等级
	--------------- 设置杂项参数 ----------------------------------------------------------------------
   skill.bIgnorePrepareState = true	--技能是否可在吟唱中施放，吟唱、通道、蓄力技不能填true
	-- skill.dwLevelUpExp      		= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0										-- 技能施放最小半径
	skill.nMaxRadius = 20 * LENGTH_BASE;						-- 技能施放最大半径
	skill.nAngleRange = 256; 									-- 施放角度
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 24;				-- 吟唱帧数
	skill.nBulletVelocity = 0;					-- 子弹速度，单位 点/帧
	 if dwSkillLevel < 18 then
  		skill.nChannelInterval = 20*1.04*1.05*1.05*1.3;
  	else
  		skill.nChannelInterval = 29*1.04*1.05*1.05*1.3;     
 	end
	--skill.nChannelFrame = 40;	 			-- 通道技持续时间，单位帧数 
	--skill.nBreakRate = 1024;					--被打断的概率,默认1024表示一定被打断
    
	return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nLevel = player.GetSkillLevel(537)
	if not nLevel then
		return
	end
	if not player.GetBuff(1383, 2) and not player.GetBuff(8528,1) then
		player.DelBuff(409, nLevel + 7)
		player.DelBuff(409, nLevel + 14)	
		player.DelBuff(409, nLevel)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com