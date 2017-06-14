---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_����ǹ��_��.lua
-- ����ʱ��:	2013/6/5 20:17:14
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
		dwSkillLevel
	);
	--ʩ����_������_��Ŀ���˺�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		702,
		dwSkillLevel
	);
	--80������Ϊ�������ⴥ�����˼����¼��͵����Ÿ����ܰ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1861,
		2
		);
	--���δ�Į���buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		9009,
		1
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
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
	
	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--����ʩ�����뾶
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

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local lv = player.GetSkillLevel(423)--�޸Ĳ������¼�
	if lv == 0 then
		return
	end

	
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end

	--[[
	if player.GetKungfuMount().dwSkillID == 10062 then
		player.nCurrentLife = player.nMaxLife * 0.05 + player.nCurrentLife
		if player.GetSkillLevel(5693) == 1 and target.nCurrentLife <= target.nMaxLife * 0.3 then
			player.nCurrentLife = player.nMaxLife * 0.05 + player.nCurrentLife
		end
	end
	--]]
	
	if player.GetSkillLevel(6524) == 1 and target.nCurrentLife <= target.nMaxLife * 0.4 then
		--��նɱ�����˺�
		player.CastSkill(6525, lv)
		player.CastSkill(6526, lv)
		--��Ѩ��¥��˫��
		if target.nMoveState ~= MOVE_STATE.ON_DEATH then
			if not player.GetBuff(8433, 1) then
				player.AddBuff(player.dwID, player.nLevel, 8432, 1, 1)
			else
				player.DelBuff(8433, 1)
			end
		end
	end
	if player.GetBuff(8433, 1) then
		player.DelBuff(8433, 1)
	end

	--���ѧϰ��Ѩ�Ͳ�����������˺�
	if player.GetSkillLevel(5678) ~= 1 and player.GetSkillLevel(5682) ~= 1 then
		--��������˺�
		player.CastSkill(716, lv)
		player.CastSkill(717, lv)
	end

	--�ظ�����8%��Ѫ���ֵ
	if player.GetSkillLevel(5682) == 1 then
		player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.08
	end

	if player.GetSkillLevel(14799) == 1 and	not player.GetBuff(7913,1) and player.dwShapeShiftID == 0 and player.nCurrentLife <= player.nMaxLife * 0.5 then
		player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.05
	end

	--local target = player.GetSelectCharacter()
	if player.GetSkillLevel(6530) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6131, 1, 1)
		if target.nCurrentLife <= target.nMaxLife * 0.4 then
			player.DelMultiGroupBuffByFunctionType(2)
			player.DelMultiGroupBuffByFunctionType(7)
			player.CastSkill(6531, 1) 
			--player.AddBuff(dwCharacterID, player.nLevel, 6131, 1, 1)
		end
	end
	if player.GetSkillLevel(6781) == 1 then
		target.AddBuff(player.dwID, player.nLevel, 540, 1, 1)
	end

	ModityCDToUI(player, 423, 0, 0)
end

function UnApply(dwCharacterID)
end


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com