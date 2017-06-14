------------------------------------------------
-- 创建人    :  王洋
-- 创建时间  :  2007-12-11
-- 技能效果  :  连协技触发的额外伤害技
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nLunarDamage=368 * 0.95,nLunarDamageRand=368 *0.1,nBuffStackNum = 1},
	{nLunarDamage=416 * 0.95,nLunarDamageRand=416 *0.1,nBuffStackNum = 2},
	{nLunarDamage=464 * 0.95,nLunarDamageRand=464 *0.1,nBuffStackNum = 3},
	{nLunarDamage=512 * 0.95,nLunarDamageRand=512 *0.1,nBuffStackNum = 4}
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false
	local dwSkillLevel	= skill.dwLevel
		
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
        tSkillData[dwSkillLevel].nLunarDamage, 
        0
    );
		
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
        tSkillData[dwSkillLevel].nLunarDamageRand, 
        0
    );
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
        0, 
        0
    );
    
    skill.AddAttribute(
     	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
      	ATTRIBUTE_TYPE.DETACH_MULTI_GROUP_BUFF,
       	52,						--命门BUFF
       	dwSkillLevel
   	);

    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--公共CD
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
		
	skill.AddSlowCheckSelfBuff(538, tSkillData[dwSkillLevel].nBuffStackNum, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL) --需求连协DEBUFF
		
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	-- skill.nCostMana			= 0;
	
    --------------- 设置杂项参数 ----------------------------------------------------------------------
   
    -- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	-- skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 20 * LENGTH_BASE;						--技能施放最大半径
    skill.nAngleRange       = 128; 									--施放角度
    
    skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    skill.nChannelInterval	= 128; 				-- 通道技间隔时间 
    --skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数 
    
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

function Apply(dwCharacterID)
		local player = GetPlayer(dwCharacterID)
		for i = 1, 4 do
			player.CastSkill(525, i)
		end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com