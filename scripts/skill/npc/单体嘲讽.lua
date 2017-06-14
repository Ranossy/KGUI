------------------------------------------------
-- 文件名    :  单体嘲讽
-- 创建人    :  郑海星
-- 创建时间  :  20110418 
-- 用途(模块):  武功技能
-- 武功门派  :  
-- 武功类型  :  
-- 武功套路  :  
-- 技能名称  :  定千军
-- 技能效果  : 
--                  
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--附加仇恨暂定和技能伤害相等
tSkillData =
{

};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= skill.dwLevel;

	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.SPOOF,
		0,
		0
	);	
	skill.BindBuff(1,2843,1);



    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--公共CD1秒
	--skill.SetNormalCoolDown(1, 93);
	--skill.SetNormalCoolDown(2, 259);
	
	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= tSkillData[dwSkillLevel].nThreat;
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
	 ----------------- 时间相关 -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- 吟唱帧数
    --skill.nChannelInterval	= 15; 				-- 通道技间隔时间 
    --skill.nChannelFrame		= 48;	 			-- 通道技持续时间，单位帧数 
    --skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
    
        ----------------- 打断相关 -------------------------------------------------
    --skill.nBrokenRate      = 0 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
    --skill.nBreakRate		= 0;					-- 打断目标施法的概率,基数1024
    
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	skill.nWeaponDamagePercent	= 0;
	
	skill.nMinRadius		= 0											--技能施放最小半径
	skill.nMaxRadius		= 20 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange       = 256; 										--施放角度,全角256
    
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

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com