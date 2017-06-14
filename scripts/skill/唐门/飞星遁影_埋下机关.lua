---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/���Ƕ�Ӱ_���»���.lua
-- ����ʱ��:	2017/4/12 18:16:45
-- �����û�:	XIAXIANBO1
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  ֣����
-- ����ʱ��	:  20111101
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/���Ƕ�Ӱ_���»���.lua", --����ֵ1
		0															--����ֵ2
	);

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(3249, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 3249, 1);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(1, 486);	--������ͨCD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostEnergy = 20;							-- �������ĵ�����
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID

	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=

	----------------- ����Ѫ������ ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
	--skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=

	----------------- ���˴��������� -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult, SkillTarget)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	--[[
	if nPreResult ~= SKILL_RESULT_CODE.SUCCESS then
		return nPreResult
	end
	if  not player.GetBuff(3429, 1)  then
		player.SendSystemMessage("����ʽ����ĵ�ҩ���㡣")
		return false;
	else
		return SKILL_RESULT_CODE.SUCCESS
	end
	--]]
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
	local scene = cPlayer.GetScene()
	if not scene then
		return
	end
	
	local nCount = 0
	for i = 1, 2 do
		if cPlayer.GetBuff(11885 + i, 1) then
			nCount = nCount + 1
		end
	end

	--���ش����ڼ���Լ�30��10%����
	if cPlayer.GetSkillLevel(14811) == 1 then
		cPlayer.AddBuff(cPlayer.dwID, cPlayer.nLevel, 9845, 1)
	end

	local PI = 3.1416;
	local nAngel = PI / 2;
	local nR = 100;
	local nDir = cPlayer.nFaceDirection;
	local dwAngel = (cPlayer.nFaceDirection * 1.4 - 90) / 180 * PI + nAngel;
	local nCX = cPlayer.nX + nR * math.cos(dwAngel);
	local nCY = cPlayer.nY + nR * math.sin(dwAngel);
	local nResault = cPlayer.CastSkillXYZ(3638, 1, nCX, nCY, cPlayer.nZ)
	--print(11111)
	--print(nResault)
	--print(nResault)
	--print(nCX)
	--print(nCY)
	--print(cPlayer.nZ)
	if nResault == 1 then
		--print(2222)
		local cNpc = scene.CreateNpc(15959, nCX, nCY, cPlayer.nZ, 0, 480, nil, dwCharacterID, true, cPlayer.dwIdentityVisiableID)
		cNpc.SetCustomUnsigned4(0, cPlayer.dwID)
		--print(cPlayer.dwID)
		cNpc.AddBuff(cPlayer.dwID, cPlayer.nLevel, 3242, 1)
		--cNpc.AddBuff(0,99,3361,1)
		cNpc.SetModelID(26106)
		cPlayer.SetTimer(22, "scripts/skill/����/���Ƕ�Ӱ_���»���.lua", cNpc.dwID, 0)
		if cNpc then
			for i = 1, 2 do
				if not cPlayer.GetBuff(11885 + i, 1) then
					cPlayer.AddBuff(cPlayer.dwID, cPlayer.nLevel, 11885 + i, 1)	--��¼Ӱ��ID
					cNpc.AddBuff(cPlayer.dwID, cPlayer.nLevel, 11887 + i, 1)	--��¼Ӱ�Ӻͼ���ͼ�������ɫ

					local nbuff = cPlayer.GetBuff(11885 + i, 1)
					if nbuff then
						nbuff.nCustomValue = cNpc.dwID
						--print(cNpc.dwID)
						if nCount == 0 then
							local nSkillID = 17586 + i
							RemoteCallToClient(cPlayer.dwID, "OpenTangMenHiddenBar", {[1] = {id = nSkillID, level = 1, dwNpcID = cNpc.dwID, buff = 11885 + i}})
							--print(3333)
						else
							RemoteCallToClient(cPlayer.dwID, "CallUIGlobalFunction", "FireUIEvent", "ADD_ONE_HIDDEN", 17586 + i, cNpc.dwID, false, 11885 + i)
							--print(4444)
						end
					end
					break
				end
			end
		end
	else
		local cNpc = scene.CreateNpc(15959, cPlayer.nX, cPlayer.nY, cPlayer.nZ, 0, 480, nil, dwCharacterID, true, cPlayer.dwIdentityVisiableID)
		cNpc.SetCustomUnsigned4(0, cPlayer.dwID)
		cNpc.AddBuff(cPlayer.dwID, cPlayer.nLevel, 3242, 1)
		--cNpc.AddBuff(0,99,3361,1)
		cNpc.SetModelID(26106)
		cPlayer.SetTimer(22, "scripts/skill/����/���Ƕ�Ӱ_���»���.lua", cNpc.dwID, 0)
		if cNpc then
			for i = 1, 2 do
				if not cPlayer.GetBuff(11885 + i, 1) then
					cPlayer.AddBuff(cPlayer.dwID, cPlayer.nLevel, 11885 + i, 1)	--��¼Ӱ��ID
					cNpc.AddBuff(cPlayer.dwID, cPlayer.nLevel, 11887 + i, 1)	--��¼Ӱ�Ӻͼ���ͼ�������ɫ

					local nbuff = cPlayer.GetBuff(11885 + i, 1)
					if nbuff then
						nbuff.nCustomValue = cNpc.dwID
						--print(cNpc.dwID)
						if nCount == 0 then
							local nSkillID = 17586 + i
							RemoteCallToClient(cPlayer.dwID, "OpenTangMenHiddenBar", {[1] = {id = nSkillID, level = 1, dwNpcID = cNpc.dwID, buff = 11885 + i}})
							--print(5555)
						else
							RemoteCallToClient(cPlayer.dwID, "CallUIGlobalFunction", "FireUIEvent", "ADD_ONE_HIDDEN", 17586 + i, cNpc.dwID, false, 11885 + i)
							--print(6666)
						end
					end
					break
				end
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)				-- һ��ʱ�����Ч
	local npc = GetNpc(nParam1)
	if npc then
		npc.SetModelID(26069)
		--npc.AddBuff(0, 99, 3361, 1)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com