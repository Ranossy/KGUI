------------------------------------------------
-- 文件名    :  长安_祁进五方行尽.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-12-29
-- 用途(模块):  武功技能
-- 武功门派  :  纯阳
-- 武功类型  :  内功
-- 武功套路  :  北冥剑气
-- 技能名称  :  五方行尽
-- 技能效果  :  前方扇形范围AOE
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nDamageBase = 88,  nDamageRand = 44,   nCostMana = 0}, 		--level 1
	
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
    skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- 属性作用模式
   		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE,								-- 魔法属性
   		tSkillData[dwSkillLevel].nDamageBase * 0.14,							-- 属性值1
   		0																-- 属性值2
   		);
   		
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- 属性作用模式
   		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND,							-- 魔法属性
   		tSkillData[dwSkillLevel].nDamageRand * 0.14,							-- 属性值1
   		0																-- 属性值2
   		);
    
    skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,				-- 属性作用模式
   		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE,								-- 魔法属性
   		0,																-- 属性值1
   		0																-- 属性值2
   		);
   		
	
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --CoolDown位(共4个)，SetCoolDown(posi, id)中posi为CoolDown位，id为CoolDown，id需要查CoolDownList.tab
--    skill.SetCoolDown(1, 16);	--公共CD
--    skill.SetCoolDown(2, 169);	-- 15秒CD
    
    
    skill.BindBuff(1, 555, 1)
    
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
--	skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 8 * LENGTH_BASE;							--技能施放最大半径
    skill.nAngleRange       = 64; 										--施放角度
    skill.nAreaRadius       = 8 * LENGTH_BASE;							--技能作用半径
    skill.nTargetCountLimit = 6;
    
    skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
 	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
    --skill.nBreakRate        = 1024;									--打断的概率,默认1024表示一定打断
   
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