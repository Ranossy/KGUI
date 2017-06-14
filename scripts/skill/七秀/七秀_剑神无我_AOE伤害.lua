------------------------------------------------
-- 文件名    :  纯阳_技能事件_知北游.lua
-- 创建人    :  kingbeyond	
-- 创建时间  :  2007-12-11
-- 用途(模块):  武功技能
-- 武功门派  :  纯阳
-- 武功类型  :  外功
-- 武功套路  :  技能事件
-- 技能名称  :  知北游
-- 技能效果  :  知北游的事件技能，被击时触发，对攻击者释放一个伤害技能
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
		{nLunarDamage = 11*0.95, 	nLunarDamageRand = 11*0.1, },
		{nLunarDamage = 12*0.95, 	nLunarDamageRand = 12*0.1, },
		{nLunarDamage = 13*0.95, 	nLunarDamageRand = 13*0.1, },
		{nLunarDamage = 14*0.95, 	nLunarDamageRand = 14*0.1, },
		{nLunarDamage = 14*0.95, 	nLunarDamageRand = 14*0.1, },
		{nLunarDamage = 15*0.95, 	nLunarDamageRand = 15*0.1, }, 
		{nLunarDamage = 16*0.95, 	nLunarDamageRand = 16*0.1, },
		{nLunarDamage = 17*0.95, 	nLunarDamageRand = 17*0.1, },
		{nLunarDamage = 18*0.95, 	nLunarDamageRand = 18*0.1, },
		{nLunarDamage = 18*0.95, 	nLunarDamageRand = 18*0.1, },
		{nLunarDamage = 19*0.95, 	nLunarDamageRand = 19*0.1, },
		{nLunarDamage = 20*0.95, 	nLunarDamageRand = 20*0.1, }, 
		{nLunarDamage = 21*0.95, 	nLunarDamageRand = 21*0.1, },
		{nLunarDamage = 22*0.95, 	nLunarDamageRand = 22*0.1, },
		{nLunarDamage = 22*0.95, 	nLunarDamageRand = 22*0.1, },
		{nLunarDamage = 23*0.95, 	nLunarDamageRand = 23*0.1, },
		{nLunarDamage = 24*0.95, 	nLunarDamageRand = 24*0.1, },
		{nLunarDamage = 25*0.95, 	nLunarDamageRand = 25*0.1, }, 
		{nLunarDamage = 26*0.95, 	nLunarDamageRand = 26*0.1, },
		{nLunarDamage = 26*0.95, 	nLunarDamageRand = 26*0.1, },
		{nLunarDamage = 27*0.95, 	nLunarDamageRand = 27*0.1, },
		{nLunarDamage = 28*0.95, 	nLunarDamageRand = 28*0.1, },
		{nLunarDamage = 29*0.95, 	nLunarDamageRand = 29*0.1, },
		{nLunarDamage = 30*0.95, 	nLunarDamageRand = 30*0.1, }, 
		{nLunarDamage = 30*0.95, 	nLunarDamageRand = 30*0.1, },
		{nLunarDamage = 31*0.95, 	nLunarDamageRand = 31*0.1, },
		{nLunarDamage = 32*0.95, 	nLunarDamageRand = 32*0.1, },
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;
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

	--skill.nDamageToManaForParty = 51    --5%伤害转化为队友内力
    
    
   	

    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--公共CD
    --skill.SetNormalCoolDown(2, 113);--技能CD
		--破绽段位
		--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
		
		
		--skill.AddSlowCheckDstDebuff(BUFF_STYLE.DEBUFF,1054,1)
		
		----------------- 设置技能消耗 ---------------------------------------------------------------------
		--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    --------------- 设置杂项参数 ----------------------------------------------------------------------
   
    -- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
		-- skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0										--技能施放最小半径
    skill.nMaxRadius        = 10 * LENGTH_BASE;						--技能施放最大半径
    skill.nAngleRange       = 256; 									--施放角度
    skill.nAreaRadius		= 10 * LENGTH_BASE;
    skill.nTargetCountLimit	= 10;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    skill.nPrepareFrames    = 0;									--吟唱帧数,16帧等于1秒
    if dwSkillLevel < 10 then
  		skill.nChannelInterval = 16;
 	elseif dwSkillLevel < 27 then
  		skill.nChannelInterval = 16 + (dwSkillLevel - 9) * 1
  	else
  		skill.nChannelInterval =36;     -- 通道技间隔时间   
 	end
 	skill.nBulletVelocity   = 0;									--子弹速度,点/帧
    
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