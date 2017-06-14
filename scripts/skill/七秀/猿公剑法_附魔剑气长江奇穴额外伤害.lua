---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/猿公剑法_剑气长江.lua
-- 更新时间:	2013/5/1 12:13:13
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人    :  kingbeyond	
-- 创建时间  :  2009-3-13
-- 技能效果  :  单体阴性伤害切10%伤害给队友回内
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nLunarDamage = 33*2*0.98, nLunarDamageRand = 33*2*0.04,  nCostMana = 30 },
	{nLunarDamage = 41*2*0.98, nLunarDamageRand = 41*2*0.04,  nCostMana = 50 },
	{nLunarDamage = 50*2*0.98, nLunarDamageRand = 50*2*0.04,  nCostMana = 67 },
	{nLunarDamage = 58*2*0.98, nLunarDamageRand = 58*2*0.04,  nCostMana = 93 },
	{nLunarDamage = 67*2*0.98, nLunarDamageRand = 67*2*0.04,   nCostMana = 111},
	{nLunarDamage = 75*2*0.98, nLunarDamageRand = 75*2*0.04,   nCostMana = 130},
	{nLunarDamage = 84*2*0.98, nLunarDamageRand = 84*2*0.04,   nCostMana = 149},
	{nLunarDamage = 92*2*0.98, nLunarDamageRand = 92*2*0.04,   nCostMana = 167},
	{nLunarDamage = 101*2*0.98, nLunarDamageRand = 101*2*0.04,   nCostMana = 186},
	{nLunarDamage = 109*2*0.98, nLunarDamageRand = 109*2*0.04,   nCostMana = 186},
	{nLunarDamage = 118*2*0.98, nLunarDamageRand = 118*2*0.04,   nCostMana = 30 },
	{nLunarDamage = 126*2*0.98, nLunarDamageRand = 126*2*0.04,   nCostMana = 50 },
	{nLunarDamage = 135*2*0.98, nLunarDamageRand = 135*2*0.04,   nCostMana = 67 },
	{nLunarDamage = 143*2*0.98, nLunarDamageRand = 143*2*0.04,   nCostMana = 93 },
	{nLunarDamage = 152*2*0.98, nLunarDamageRand = 152*2*0.04,   nCostMana = 111},
	{nLunarDamage = 160*2*0.98, nLunarDamageRand = 160*2*0.04,   nCostMana = 130},
	{nLunarDamage = 169*2*0.98, nLunarDamageRand = 169*2*0.04,   nCostMana = 149},
	{nLunarDamage = 177*2*0.98, nLunarDamageRand = 177*2*0.04,   nCostMana = 167},
	{nLunarDamage = 186*2*0.98, nLunarDamageRand = 186*2*0.04,   nCostMana = 186},
	{nLunarDamage = 194*2*0.98, nLunarDamageRand = 194*2*0.04,   nCostMana = 186},
	{nLunarDamage = 203*2*0.98, nLunarDamageRand = 203*2*0.04,   nCostMana = 30 },
	{nLunarDamage = 211*2*0.98, nLunarDamageRand = 211*2*0.04,   nCostMana = 50 },
	{nLunarDamage = 220*2*0.98, nLunarDamageRand = 220*2*0.04,   nCostMana = 67 },
	{nLunarDamage = 228*2*0.98, nLunarDamageRand = 228*2*0.04,   nCostMana = 93 },
	{nLunarDamage = 237*2*0.98, nLunarDamageRand = 237*2*0.04,   nCostMana = 111},
	{nLunarDamage = 245*2*0.98, nLunarDamageRand = 245*2*0.04,   nCostMana = 130},
	{nLunarDamage = 254*2*0.98, nLunarDamageRand = 254*2*0.04,   nCostMana = 149},
	{nLunarDamage = 262*2*0.98, nLunarDamageRand = 262*2*0.04,   nCostMana = 167},
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
		tSkillData[dwSkillLevel].nLunarDamage*0.25,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nLunarDamageRand*0.25,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
		0,
		0
	);
   	
	----------------- 设置CoolDown ---------------------------------------------------------------------
	skill.AddSlowCheckDestOwnBuff(7991, 4, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- 需求目标属于自己的Buff
	--skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	--skill.AddSlowCheckSelfBuff(5866, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);	--公共CD
	--skill.SetNormalCoolDown(1, 123);	--自身CD10秒
	--skill.SetCheckCoolDown(1, 444);	
	--skill.nDamageToManaForParty = 51;	-- 伤害的5%转为自身回内
	
	--skill.AddSlowCheckSelfBuff(409, 3, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --需求剑舞BUFF
		
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostManaBasePercent = 472;	-- 技能消耗的内力
	--------------- 设置杂项参数 ----------------------------------------------------------------------
   
	-- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 25 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange = 128; 									--施放角度
    
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒

	if dwSkillLevel < 10 then
		skill.nChannelInterval = 64*1.1*1.2*1.1*0.2;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = (64 + (dwSkillLevel - 9) * 4)*1.1*1.2*1.1*0.2
	else
		skill.nChannelInterval =152*1.1*1.2*1.1*0.2;     -- 通道技间隔时间   
	end
	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
	skill.nBreakRate = 1024;									--被打断的概率,默认1024表示一定被打断
    
	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
end

function OnSkillLevelUp(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com