---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_��צ��_����ʽ.lua
-- ����ʱ��:	2013/7/25 15:27:19
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������    :  CBG
-- ����ʱ��  :  2011-04-01
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ��צ��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--���ӳ���ݶ��ͼ����˺����
tSkillData = 
{
	{nDamage = 120 * 0.95, nDamageRand = 120 * 0.1, nCostMana = 53 }, --level 1
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
	--ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
	--"skill/����/����_��צ��_����ʽ.lua", -- ����ֵ1
	--0														-- ����ֵ2
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3816,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3814,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3815,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.ACCUMULATE,
		1,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		748,
		1
	);   
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
	--ATTRIBUTE_TYPE.CALL_BUFF, -- ħ������
	--3880, --����ֵ1
	--dwSkillLevel															--����ֵ2
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/����_��צ��_����ʽ.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 2687, 1);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		--����CD1��
	skill.SetNormalCoolDown(1, 421);
	skill.SetCheckCoolDown(1, 444);
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 2 then
		skill.nCostManaBasePercent = 342*0.25;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 342;	-- �������ĵ�����
	end
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 15; 				-- ͨ�������ʱ�� 
	--skill.nChannelInterval		= 64;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate      = 0 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
    
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 8 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
	skill.nWeaponDamagePercent = 0;
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
end
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetBuff(3880, 1) then
		--[[
		--������ȱ��Ϣʱ��
		if player.GetSkillLevel(6595) == 1 then
			if player.GetBuff(3880, 1).nStackNum == 2 then
				if not player.GetBuff(6198, 1) then
					player.AddBuff(dwCharacterID, player.nLevel, 6198, 1, 1)
				end
			end
		end
		--]]
		--������ȱ������
		if player.GetSkillLevel(6596) == 1 then
			if player.GetBuff(3880, 1).nStackNum == 2 then
				player.AddBuff(dwCharacterID, player.nLevel, 6417, 1, 1)
			end
			--player.AddBuff(dwCharacterID, player.nLevel, 6417, 1, 1)
		end
	end
	player.AddBuff(dwCharacterID, player.nLevel, 3880, 1, 1)

	--20%���ʶ���ظ�һ������
	local i
	if player.GetSkillLevel(5912) == 1 then
		i = Random(1, 10000)
		if i <= 2000 then
			player.CastSkill(1018, 1)
		end
	end
	--[[
	if player.GetSkillLevel(5915) == 1 then
		i = Random(1, 5)
		if i == 1 then
			player.CastSkill(1018, 1)
		end
	end
	--]]	   
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com