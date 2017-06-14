------------------------------------------------
-- 文件名    :  天策_子技能_疾如风_傲血战意
-- 创建人    :  张奇	
-- 创建时间  :  2008-09-10 
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  傲雪战意	
-- 技能名称  :  疾如风
-- 技能效果  :  50级傲血战意.疾如风解除所有点穴,并且免疫点穴5秒.
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
     {nCostMana = 0, nBuffID = 745},		-- Level 1
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		2, 
		9999
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		3, 
		9999
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		4, 
		9999
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		6, 
		9999
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		8, 
		9999
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		7, 
		9999
	);
	skill.AddAttribute(					
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,	--解除击倒
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		7276,										
		1
	);
	--skill.BindBuff(1, 855,1);
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--公共CD1秒
	--skill.SetNormalCoolDown(2, 149);	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;

    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 4 * LENGTH_BASE;							--技能施放最大半径
    skill.nAngleRange       = 256; 										--施放角度,全角256
    
    
    skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
 	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
    skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
   
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
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com