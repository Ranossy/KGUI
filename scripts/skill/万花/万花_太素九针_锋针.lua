---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_̫�ؾ���_����.lua
-- ����ʱ��:	2015/9/28 1:12:48
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/skill����/����ʹ�ø���ܻ�ж�.lua")

tSkillData =
{
	{ nReviveLife = 245, nReviveMana = 295, nCostMana = 225},
	{ nReviveLife = 409, nReviveMana = 491, nCostMana = 376},
	{ nReviveLife = 545, nReviveMana = 655, nCostMana = 501},
	{ nReviveLife = 682, nReviveMana = 818, nCostMana = 627},
	{ nReviveLife = 818, nReviveMana = 982, nCostMana = 752},
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.REVIVE,
		tSkillData[dwSkillLevel].nReviveLife, --���������Ϊ50tSkillData[dwSkillLevel].nReviveLife
		tSkillData[dwSkillLevel].nReviveMana		--���������Ϊ50tSkillData[dwSkillLevel].nReviveMana
	);
	--ɾ��������˱��buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		9298,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/��/��_̫�ؾ���_����.lua", -- ����ֵ1
		0														-- ����ֵ2
	);

	--skill.AddSlowCheckSelfBuff(2719, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff
	skill.AddSlowCheckDestBuff(203, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);	--����CD
	skill.SetCheckCoolDown(1, 444)
	--skill.SetNormalCoolDown(1, 37);

	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= 0;
	skill.nCostManaBasePercent = 1154;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	skill.nMinPrepareFrames = 1;
	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 20 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 256; 									--ʩ�ŽǶ�

	skill.nPrepareFrames = 160;										--����֡��,16֡����1��

	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡

	--skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	local nResult = CheckCamp(player)
	if not nResult then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 3567), 4)
		return SKILL_RESULT_CODE.FAILED
	end

	return nPreResult;
	--[[
	local target = player.GetSelectCharacter()
	local i, buff1, tbuff1, buff2, tbuff2
	if not target then
		for i = 1, 5 do
			buff1 = player.GetBuff(203, i)
			if buff1 then
				tbuff1 = 1
				break
			end
		end
		if (not player.GetBuff(5971, 1)) and tbuff ~= 1 then
			return nPreResult;
		elseif player.nCurrentLife <= player.nMaxLife * 0.01 then
			player.SendSystemMessage("������Ѫֵ���ͣ��޷�ʩչ����ʽ")
			return false
		else
			return false
		end
	else
		for i = 1, 5 do
			buff2 = target.GetBuff(203, i)
			if buff2 then
				tbuff2 = 1
				break
			end
		end
		if target.nMoveState == 16  then
			if not player.GetBuff(6009, 1) then
				player.AddBuff(player.dwID, player.nLevel, 6009, 1, 1)
			end
			return nPreResult;
		elseif ((not player.GetBuff(5971, 1)) and IsParty(player.dwID, target.dwID)) or (player.dwID == target.dwID and (not player.GetBuff(5971, 1))) then
			return nPreResult;
		elseif target.nCurrentLife <= target.nMaxLife * 0.01 then
			player.SendSystemMessage("Ŀ����Ѫֵ���ͣ��޷�ʩչ����ʽ")
			return false
		elseif tbuff2 == 1 then
			player.SendSystemMessage("Ŀ�����в������˵�Ч�����޷�ʩչ����ʽ")
			return false
		else
			return false
		end
	end
	--]]
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(48)
	end
end

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end
	--[[
	if (not player.GetBuff(6009, 1)) then
		if (target.nMoveState ~= 16 and IsParty(dwCharacterID, dwSkillSrcID)) or dwCharacterID == dwSkillSrcID then
			if target.nCurrentLife > target.nMaxLife * 0.01 then
				target.AddBuff(dwSkillSrcID, player.nLevel, 5970, 1, 1800)
				player.AddBuff(dwSkillSrcID, player.nLevel, 5971, 1, 1)
			else
				player.SendSystemMessage("Ŀ����Ѫֵ���ͣ��޷���÷���Ч��")
			end
		end
	end
	--]]
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com