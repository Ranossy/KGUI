------------------------------------------------
-- 文件名    :  七秀_傲寒真气.lua
-- 创建人    :  陈步高	
-- 创建时间  :  2008-8-5
-- 用途(模块):  NPC技能
-- 武功门派  :  野外	
-- 武功类型  :  Debuff技能
-- 武功套路  :  否
-- 技能名称  :  傲寒真气
-- 技能效果  :  使目标的移动速度降低40%，持续6秒；特效为冰冻效果
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")


function GetSkillLevelData(skill)

	local bRetCode     = false;
	local dwSkillLevel =skill.dwLevel
	
 skill.BindBuff(1, 581, 1)

--	
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetNormalCoolDown(1, 1);	--公共CD
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostMana			= 0;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
--   	skill.AddSlowCheckSelfBuff(10039, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
 
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 0;

	skill.nMinRadius		= 0											--技能施放最小半径
	skill.nMaxRadius        = 5 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange       = 128; 									--施放角度
    
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

function OnSkillLevelUp(skill, player)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com