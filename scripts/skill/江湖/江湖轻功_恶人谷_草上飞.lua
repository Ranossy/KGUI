------------------------------------------------
-- 文件名    : 江湖轻功_恶人谷_草上飞.lua
-- 创建人    :  张奇	--修改By 蜘蛛
-- 创建时间  :  2009-07-14  --2009-12-18修改
-- 用途(模块):  武功技能
-- 武功门派  :  
-- 武功类型  :  
-- 武功套路  :  
-- 技能名称  :  
-- 技能效果  :  明月光，为何又照地堂，宁愿在公园躲藏不想喝汤。
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
     {nCostMana = 31, nBuffID = 1299},		-- Level 1
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= skill.dwLevel;

	for i = 1,11 do
			skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
			ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
			208,
			i
			);				--清掉梯云纵的Buff
	end		
	
	skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
			ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
			1063,
			1
			); 				--清掉梯云纵的抗摔Buff
	
	for i = 1,2 do
			skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
			ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
			1089,
			i
			);        --清掉扶摇直上的抗摔Buff
	end
	
	
	for i = 1,6 do
			skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
			ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
			139,
			i
			);				--清掉扶摇直上的Buff
	end

			skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
			ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
			3217,
			1
			);				--清掉唐门三段跳BUFF
	----------------- BUFF相关 -------------------------------------------------
	skill.BindBuff(1, 1299,1)
	skill.BindBuff(2, 1260,1) --驱除所有换模、换动作的Buff

    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
		skill.SetPublicCoolDown(16);		--公共CD1秒
    skill.SetNormalCoolDown(2, 88);    
    skill.SetNormalCoolDown(3, 248);
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    --skill.nMinRadius		= 0											--技能施放最小半径
    --skill.nMaxRadius        = MELEE_ATTACK_DISTANCE;							--技能施放最大半径
    --skill.nAngleRange       = 256; 										--施放角度,全角256
    
    
    --skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
 	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
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

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com