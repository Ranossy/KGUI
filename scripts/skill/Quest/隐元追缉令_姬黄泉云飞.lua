------------------------------------------------
-- 创建人   :  郑海星	
-- 创建时间	:  20120105
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
		{nLunarDamage= 30000    * 0.4,nLunarDamageRand= 30000    * 0.1,nCostMana= 157},
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;
		local dwSkillLevel	= skill.dwLevel
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nLunarDamage,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nLunarDamageRand,
		0
	);
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
        0, 
        0
    );
    
	--skill.BindBuff(1,3121,1)--减速
	
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--公共CD1.5秒
    --skill.SetNormalCoolDown(1, 191);	--公共CD1.5秒
    --skill.SetCheckCoolDown(1, 444);
    --skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --需求剑舞BUFF
		
		
		----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostManaBasePercent = 0.5*(1+dwSkillLevel/11)*128;	-- 技能消耗的内力
    --------------- 设置杂项参数 ----------------------------------------------------------------------
   
    -- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	-- skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 8 * LENGTH_BASE;						--技能施放最大半径
    skill.nAngleRange       = 128; 									--施放角度
    
    skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
    --skill.nChannelInterval	= 48; 

    
 		skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
    --skill.nBreakRate        = 1024;									--被打断的概率,默认1024表示一定被打断
    
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