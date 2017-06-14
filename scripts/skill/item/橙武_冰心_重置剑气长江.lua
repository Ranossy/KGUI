------------------------------------------------
-- 创建人    :  zhx	
-- 创建时间  :  20110518
-- 技能效果  :  橙武的第二次剑气长江
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{

		{nLunarDamage= 262   * 0.98,nLunarDamageRand= 262   * 0.04, nCostMana= 186},
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel

   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,					
   		ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,								
   		123,											
   		0											
   		);
	skill.AddAttribute(
        	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        	 ATTRIBUTE_TYPE.EXECUTE_SCRIPT, 
        	"skill/七秀/名动四方_添加剑舞.lua", 
        	0
    );	
	skill.AddAttribute(
        	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        	 ATTRIBUTE_TYPE.EXECUTE_SCRIPT, 
        	"skill/七秀/名动四方_添加剑舞.lua", 
        	0
    );	
    skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,		-- 属性作用模式
   		ATTRIBUTE_TYPE.ACCUMULATE,								-- 魔法属性
   		2,														-- 属性值1
   		0														-- 属性值2
   	);
--[[   	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.EXECUTE_SCRIPT, 
        "skill/七秀/七秀_七诀剑气.lua", 	-- 连协技
        0
    );--]]
    
                                              --2011年4月18日添加剑气长江消耗剑舞2层.张豪

    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--公共CD
    --skill.SetNormalCoolDown(1, 123);	--自身CD10秒
	--skill.SetCheckCoolDown(1, 444);	
	--skill.nDamageToManaForParty = 51;	-- 伤害的5%转为自身回内
	 skill.AddSlowCheckSelfBuff(1917,1,BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
	--skill.AddSlowCheckSelfBuff(409, 3, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --需求剑舞BUFF
		
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostManaBasePercent = 0.5*(1+dwSkillLevel/10)*225;	-- 技能消耗的内力
    --------------- 设置杂项参数 ----------------------------------------------------------------------
   
    -- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	-- skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius				= 0											--技能施放最小半径
    skill.nMaxRadius        = 30 * LENGTH_BASE;						--技能施放最大半径
    skill.nAngleRange       = 128; 									--施放角度
    
    skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    skill.nChannelInterval	= 64; 
    
 	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
    skill.nBreakRate        = 1024;									--被打断的概率,默认1024表示一定被打断
    
    return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
   
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