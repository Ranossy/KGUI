---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/90级奇穴/沧月嘲讽AOE.lua
-- 更新时间:	2013/4/17 21:11:03
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_沧月_子技能_群体击退.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-02-26 16:14	
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  羽林枪法
-- 技能名称  :  沧月
-- 技能效果  :  群体击退,除当前目标外.
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--附加仇恨暂定和技能伤害相等
tSkillData = 
{
	{nCostMana = 49, nTime = 20, nDamage = 43 * 0.95, nDamageRand = 43 * 0.1 }, -- Level 1
	{nCostMana = 62, nTime = 20, nDamage = 78 * 0.95, nDamageRand = 78 * 0.1 }, -- Level 1
	{nCostMana = 76, nTime = 20, nDamage = 109 * 0.95, nDamageRand = 109 * 0.1 }, -- Level 1
	{nCostMana = 90, nTime = 20, nDamage = 141 * 0.95, nDamageRand = 141 * 0.1 }, -- Level 1
	
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.SPOOF,
		0,
		0
	);	

	skill.BindBuff(1, 5645, 1);	-- 减速95%Buff
	
	
		   
    
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
--	skill.SetPublicCoolDown(16);		--公共CD1秒
--	skill.SetNormalCoolDown(2, 93);
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostMana = 0;
	
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
	
	skill.nWeaponDamagePercent = 0;
	
	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 6 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 256; 										--施放角度,全角256
	skill.nAreaRadius = 6 * LENGTH_BASE;
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity = 30;										--子弹速度,点/帧
	skill.nDismountingRate = 1024;									--落马率为100% 
	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断
	skill.nTargetCountLimit = 6;
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