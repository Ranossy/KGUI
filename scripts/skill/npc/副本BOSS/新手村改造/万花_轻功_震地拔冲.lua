------------------------------------------------
-- 文件名    :  万花_轻功_震地拔冲.lua
-- 创建人    :  刘欣
-- 创建时间  :  2008-3-7
-- 用途(模块):  武功技能
-- 武功门派  :  万花
-- 武功类型  :  外功
-- 武功套路  :  万花轻功
-- 技能名称  :  震地拔冲
-- 技能效果  :  向自己的后方快速移动，起跳时会造成范围伤害,不能命中跳跃中的目标
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData=
{
	{nSpeed = 60, nCostMana = 125},
	{nSpeed = 60, nCostMana = 226},
	{nSpeed = 60, nCostMana = 314},
	{nSpeed = 60, nCostMana = 401},
	{nSpeed = 60, nCostMana = 488},
	{nSpeed = 60, nCostMana = 576}
};
--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    local bRetCode     = false;

    	skill.AddAttribute(
        	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        	ATTRIBUTE_TYPE.DASH_BACKWARD, 
        	16, 
        	35
    	);
		
	skill.AddAttribute(
        	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        	ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, 
        	497, 						--AOE伤害技能
        	dwSkillLevel
    );
    	
  skill.BindBuff(1, 1104, 1)--换动作隐藏BUFF

	skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff--吞日月，禁轻功
	    ----------------- 设置Cool down ---------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    skill.SetPublicCoolDown(16);
    skill.SetNormalCoolDown(1, 193);
	
    ----------------- 设置杂项参数 ----------------------------------------  
	skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
    --攻击半径，也就是攻击的有效距离
    skill.nMaxRadius        = 4 * LENGTH_BASE;
    --skill.nAngleRange       = 256; 
	--skill.nAreaRadius	=	8 * LENGTH_BASE;
    --吟唱帧数
    skill.nPrepareFrames    = 0;
    --子弹速度
    skill.nBulletVelocity   = 0;
    --被打断的概率
    --skill.nDismountingRate  = 1024;									
    skill.nBreakRate        = 1000;
    --硬直
    --skill.nStiffFrames		= 16
   
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