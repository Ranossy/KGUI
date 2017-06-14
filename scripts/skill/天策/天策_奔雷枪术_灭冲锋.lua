---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_����ǹ��_����.lua
-- ����ʱ��:	2013/5/29 1:22:07
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_����ǹ��_��.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-03-05 
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����ǹ��
-- ��������  :  ��
-- ����Ч��  :  �����������,��Ŀ������˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nCostMana = 0, nDamage = 324 * 0.95, nDamageRand = 324 * 0.1, nCostLife = 149}, -- Level 1	42
	{nCostMana = 0, nDamage = 172 * 0.95, nDamageRand = 172 * 0.1, nCostLife = 172}, -- Level 2  48
	{nCostMana = 0, nDamage = 196 * 0.95, nDamageRand = 196 * 0.1, nCostLife = 196}, -- Level 3  54
	{nCostMana = 0, nDamage = 219 * 0.95, nDamageRand = 219 * 0.1, nCostLife = 219}, -- Level 4  60
	{nCostMana = 0, nDamage = 243 * 0.95, nDamageRand = 243 * 0.1, nCostLife = 243}, -- Level 5  66
	{nCostMana = 0, nDamage = 324 * 0.8, nDamageRand = 324 * 0.4, nCostLife = 324}, -- Level 6  
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	
--	skill.AddAttribute(
--        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
--        tSkillData[dwSkillLevel].nDamage, 
--        0
--    );
--
--	skill.AddAttribute(
--        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
--        tSkillData[dwSkillLevel].nDamageRand, 
--        0
--    );
--    
--    skill.AddAttribute(
--        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
--        ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
--        0, 
--        0
--    	);
	--ʩ����_��Ѫս��			--ʹ�ýű����ж�ʩ���˺�����ļ������
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		592,
--		dwSkillLevel
--	);
	--ʩ����_��Ѫս��			--ʹ�ýű����ж�ʩ���˺�����ļ������
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
--		"skill/���/���_����ǹ��_��.lua",
--		0
--	);
	--ʩ����_������_��Ŀ���˺�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		701,
		6
	);
	--ʩ����_������_��Ŀ���˺�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		702,
		6
	);
	--80������Ϊ�������ⴥ�����˼����¼��͵����Ÿ����ܰ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1861,
		2
	);
	--ʩ����_������_�������˺�				--����ʹ�ýű��ж���ʩ��
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CAST_SKILL,
	--716,
	--6
	--);
	--ʩ����_������_�������˺�
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CAST_SKILL,
	--717,
	--6
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/���/���_����ǹ��_��.lua", -- ����ֵ1
		0														-- ����ֵ2
	);

        
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		--����CD1��
	skill.SetNormalCoolDown(1, 101);
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= 0;	--tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostLife	=	tSkillData[dwSkillLevel].nCostLife;
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	skill.nWeaponDamagePercent = 1024;
	skill.nTargetLifePercentMin = 10;	
	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 10* LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	skill.nChannelInterval = 64; 
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
	return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(38)
	end
	-- if player.IsAchievementAcquired(36) and player.IsAchievementAcquired(37) and player.IsAchievementAcquired(38) and player.IsAchievementAcquired(39) and player.IsAchievementAcquired(40) and player.IsAchievementAcquired(41) then
		-- player.AcquireAchievement(68)
	-- end
end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetKungfuMount().dwSkillID == 10062 then
		player.nCurrentLife = player.nMaxLife * 0.05 + player.nCurrentLife
	end
	local target = player.GetSelectCharacter()
	if player.GetSkillLevel(6524) == 1 and target.nCurrentLife <= target.nMaxLife * 0.3 then
		player.CastSkill(6525, 6)
		player.CastSkill(6526, 6)
	else
		player.CastSkill(716, 6)
		player.CastSkill(717, 6)
	end
end

function UnApply(dwCharacterID)
end


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com