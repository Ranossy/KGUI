------------------------------------------------
-- 文件名    :  斗转星移.lua
-- 创建人    :  蜘蛛
-- 创建时间  :  2009-9-09
-- 用途(模块):  武功技能
-- 武功门派  :  江湖
-- 武功类型  :  外功
-- 武功套路  :  测试技能
-- 技能名称  :  斗转星移 前
-- 技能效果  :  不告诉你
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData=
{
		{}	
};
--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    local bRetCode     = false;

    	skill.AddAttribute(
        	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        	ATTRIBUTE_TYPE.DASH_RIGHT, 
        	6, 
        	128
    	);
    
    skill.BindBuff(1,1402,1)  --换动作用隐藏Buff
    --skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff--吞日月，禁轻功
	
    ----------------- 设置Cool down ---------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);
    --skill.SetNormalCoolDown(2, 88);    
    --skill.SetNormalCoolDown(3, 165);
	
    ----------------- 设置杂项参数 ----------------------------------------  

    --攻击半径，也就是攻击的有效距离
    --skill.nMaxRadius        = 4 * LENGTH_BASE;
    --skill.nAngleRange       = 64; 
    --吟唱帧数
    skill.nPrepareFrames    = 0;
    --子弹速度
    skill.nBulletVelocity   = 0;
    --被打断的概率
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