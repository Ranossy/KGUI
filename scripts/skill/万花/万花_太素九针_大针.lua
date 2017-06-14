---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_太素九针_大针.lua
-- 更新时间:	2013/6/6 19:40:12
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  万花_太素九针_大针.lua
-- 创建人    :  吴娟	
-- 创建时间  :  2008-8-20 
-- 用途(模块):  武功技能
-- 武功门派  :  万花
-- 武功类型  :  外功
-- 武功套路  :  太素九针
-- 技能名称  :  大针
-- 技能效果  :  损耗自身生命,对目标回复内力
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nMana = 1808, nDamageRand = 0, nCostLife = 1808},
	{ nMana = 2518, nDamageRand = 0, nCostLife = 2518},
	{ nMana = 3318, nDamageRand = 0, nCostLife = 3318},
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/万花/万花_太素九针_大针.lua",
		0
	);	

	--skill.AddSlowCheckSelfBuff(2719, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff   
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		-- 公共CD1秒
	skill.SetNormalCoolDown(1, 208);		-- 3分钟CD
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= 0;	--tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostLife	=	tSkillData[dwSkillLevel].nCostLife;--消耗气血
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	--skill.nWeaponDamagePercent	= 1024;
	
	skill.nMinRadius		= 0											--技能施放最小半径
	skill.nMaxRadius = 30 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 256; 										--施放角度,全角256
	skill.nAreaRadius = 30 * LENGTH_BASE;
	--skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nSelfLifePercentMin = 50;				-- 血量最小值>=
    
	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
	--skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
   
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

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	local target = GetPlayer(dwCharacterID)
	target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 0.2
	if not player.GetBuff(6321, 1) then
		player.nCurrentLife = player.nCurrentLife-player.nMaxLife * 0.2
		player.AddBuff(dwSkillSrcID, player.nLevel, 6321, 1, 1)
	end
	--if not IsPlayer(dwCharacterID) then
	--return
	--end
	--local player = GetPlayer(dwCharacterID)
	--if not player then
	--return
	--end
	--local targetType , targetID = player.GetSkillTarget ()
	--local target = GetPlayer(targetID)
	--if not target then
	--return
	--end
	--if player.GetSkillLevel(143) == 1 then
	--if player.nCurrentLife < player.nMaxLife * 20 / 100 then
	--player.nCurrentLife = 10
	--target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 40 / 100
	--else
	--player.nCurrentLife = player.nCurrentLife - player.nMaxLife * 20 / 100
	--target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 40 / 100
	--end
	--end
	--if player.GetSkillLevel(143) == 2 then
	--if player.nCurrentLife < player.nMaxLife * 15 / 100 then
	--player.nCurrentLife = 10
	--target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 30 / 100
	--else
	--player.nCurrentLife = player.nCurrentLife - player.nMaxLife * 15 / 100
	--target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 30 / 100
	--end
	--end
	--if player.GetSkillLevel(143) == 3 then
	--if player.nCurrentLife < player.nMaxLife * 20 / 100 then
	--player.nCurrentLife = 10
	--target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 40 / 100
	--else
	--player.nCurrentLife = player.nCurrentLife - player.nMaxLife * 20 / 100
	--target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 40 / 100
	--end
	--end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com