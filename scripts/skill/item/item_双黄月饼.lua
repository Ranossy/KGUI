--剑侠情缘网络版三 千秋万载 一统江湖
--武功技能
--礼品道具技能-CD专用
--技能效果简单说明：给道具技能CD专用
--CBG 2009-09-23

--------------厚道的分割线-----------------------------------------------------
tSkillData = 
{
    {nAttraction = 10},
};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	
	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,				-- 属性作用模式
   		ATTRIBUTE_TYPE.ADD_FELLOWSHIP_ATTRACTION,								-- 魔法属性
   		tSkillData[dwSkillLevel].nAttraction,							-- 属性值1
   		0																-- 属性值2
   		);

	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- 属性作用模式
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- 魔法属性
   		"skill/item/item_双黄月饼.lua",				-- 属性值1
   		0														-- 属性值2
   		);
 
  ----------------- 时间相关 -------------------------------------------------
    ----------------- 设置Cool down --------------------------------------------
    --CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
    --skill.SetPublicCoolDown(16);						-- 公共CD 1.5秒
    skill.SetNormalCoolDown(1, 216);
    
    skill.nPrepareFrames  	= 80;				-- 吟唱帧数
    --skill.nChannelInterval	= 0; 				-- 通道技间隔时间 
    --skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数 
    --skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
    skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离 
    skill.nMaxRadius    = 8 * LENGTH_BASE;
    skill.nAngleRange   = 128; 
    skill.nBrokenRate   = PERCENT_BASE;	
    --吟唱帧数
	skill.nPrepareFrames    = 38;
	          
    return true;
end    

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
    return nPreResult;
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.AddAchievementCount(600, 1)
	local scene = player.GetScene()
	if scene.dwMapID == 40 and player.nY > 22299 and player.nX > 19229 then
		player.AddAchievementCount(1435, 1)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com