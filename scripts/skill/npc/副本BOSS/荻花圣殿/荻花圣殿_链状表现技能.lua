------------------------------------------------
-- 创建人   :  张豪		
-- 创建时间	:  2011-4-18
-- 效果备注	:  测试技能
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
    {nDamage = 230*0.95, nDamageRand = 230*0.1, nLevel= 1 , nCostMana = 57, nDebuffLevel = 1},
};



--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= skill.dwLevel;
	
	skill.SetSubsectionSkill(1, 1, 2526, dwSkillLevel);
		
	skill.BindBuff(1, 2774, 1);
	
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);		--公共CD1秒
    --skill.SetNormalCoolDown(1, 437);
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	skill.nChainBranch	= 1;					--链状技能分支数
  skill.nChainDepth		= 1;					--链状技能层数
	
	skill.nWeaponDamagePercent	= 2048;
	skill.nMinRadius		= 0											--技能施放最小半径
	skill.nMaxRadius        = 20 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange       = 128; 										--施放角度,全角256
	skill.nChannelInterval	= 480; 				-- 通道技间隔时间 
  skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数 
	--skill.nPrepareFrames    = 24;										--吟唱帧数,16帧等于1秒
 	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
	--skill.nBreakRate	= 1024;									--打断施法概率
  
    return true;
end


--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com