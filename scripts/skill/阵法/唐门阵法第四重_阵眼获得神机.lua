------------------------------------------------
-- 创建人    :  郑海星
-- 创建时间  :  20110920
-- 用途(模块):  唐门阵法
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- 魔法属性 -------------------------------------------------
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- 属性作用模式
   		ATTRIBUTE_TYPE.CURRENT_ENERGY,								-- 魔法属性
   		10,															-- 属性值1
   		0															-- 属性值2
   		);
    
	----------------- 技能施放Buff需求 ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	skill.AddSlowCheckDestBuff(2869, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	
	skill.BindBuff(1, 2869, 1);
	----------------- BUFF相关 -------------------------------------------------
   -- skill.BindBuff(1, 925, 1);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

    ----------------- 设置Cool down --------------------------------------------
    -- 公共CD
    --skill.SetPublicCoolDown(218);							-- 3秒CD
    -- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
    --skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	

    ----------------- 设置杂项参数 ---------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    --skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 30 * LENGTH_BASE;							--技能施放最大半径
    skill.nAngleRange       = 256; 										--施放角度
    --skill.nAreaRadius 		= 20 * LENGTH_BASE;							--作用范围
    
    --skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
 	--skill.nBulletVelocity   = 12;										--子弹速度,点/帧
    
    --skill.nBreakRate        = 1024;									--被打断的概率,默认1024表示一定被打断
	
    return true;
end



-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
    return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
	
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com