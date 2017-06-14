------------------------------------------------
-- 创建人   :  郑海星
-- 创建时间	:  20111103
-- 效果备注	:  四象轮回子技能
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nDamageBase = 28.5*0.95, 	nDamageRand = 28.5*0.1, nRate = 1000},		--level 1
	{ nDamageBase = 33.5*0.95, 	nDamageRand = 33.5*0.1, nRate = 2000},		--level 2
	{ nDamageBase = 37.5*0.95, 	nDamageRand = 37.5*0.1, nRate = 3000},		--level 3
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
   	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- 属性作用模式
        ATTRIBUTE_TYPE.NEUTRAL_CRITICAL_STRIKE_BASE_RATE,				-- 混元会心几率
        tSkillData[dwSkillLevel].nRate, 							
        0			
        );		
   		
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.MAGIC_CRITICAL_DAMAGE_POWER_BASE_KILONUM_RATE,				
	tSkillData[dwSkillLevel].nRate / 10,
        0
	);

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE,
        tSkillData[dwSkillLevel].nDamageBase, 
        0
    	);
	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND,
        tSkillData[dwSkillLevel].nDamageRand, 
        0
    	);
	
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE,
        0, 
        0
    	);

    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.ACCUMULATE,
        1, 
        0
    	);
	
	----------------- 技能施放Buff需求 ---------------------------------------------
    skill.AddSlowCheckDestOwnBuff(3437, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- 需求目标Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);	-- 公共CD
	skill.SetNormalCoolDown(1, 461);
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 30 * LENGTH_BASE;						--技能施放最大半径
    skill.nAngleRange       = 128; 									--施放角度
    skill.nChannelInterval	= 50; 				-- 通道技间隔时间  
    --skill.nPrepareFrames    = 24;										--吟唱帧数,16帧等于1秒
    
 	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
    skill.nBreakRate        = 1024;									--被打断的概率,默认1024表示一定被打断
       
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