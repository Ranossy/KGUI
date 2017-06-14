------------------------------------------------
-- 文件名    :  天策_子技能_灭_傲血战意.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-09-11 16:14	
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  奔雷枪术
-- 技能名称  :  灭
-- 技能效果  :  在傲血战意6级以上,30%血量,使用灭的消耗减半,在成功施放灭后,给施放者回血为原消耗的一半
--                  
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nCostLife = 149,nAddLife = 149/2},			-- Level 1	28    
	{nCostLife = 172,nAddLife = 172/2},         -- Level 2  36    
	{nCostLife = 196,nAddLife = 196/2},         -- Level 3  44    
	{nCostLife = 219,nAddLife = 219/2},         -- Level 4  52    
	{nCostLife = 243,nAddLife = 243/2},         -- Level 5  60    
	{nCostLife = 324,nAddLife = 324/2},         -- Level 6  68    

};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= skill.dwLevel;



	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.THERAPY_POWER_PERCENT,
		-1024,
		0
	);
    	

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_THERAPY,
		tSkillData[dwSkillLevel].nAddLife,
		0
	);
    	


    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);		--公共CD1秒
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostMana	=  0;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
	skill.nSelfLifePercentMin	= 0;			-- 血量最小值>=
	skill.nSelfLifePercentMax	= 30;			-- 血量最大值<=
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 4 * LENGTH_BASE;							--技能施放最大半径
    skill.nAngleRange       = 128; 										--施放角度,全角256
    
    
    skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
 	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
    skill.nBreakRate        = 1024;									--被打断的概率,默认1024表示一定被打断
    ----------------- 自身血量需求 ---------------------------------------------
	skill.nSelfLifePercentMin	= 0;			-- 血量最小值>=
	skill.nSelfLifePercentMax	= 30;			-- 血量最大值<=
	
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